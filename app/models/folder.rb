require 'digest'

class Folder < ActiveRecord::Base
  before_validation :generate_secret

  validates :name,    presence: true, uniqueness: true
  validates :secret,  presence: true
  validate :existing_folder_is_directory

  after_validation :create_folder

  def path
    @path ||= File.expand_path name
  end

  def basename
    @base_name ||= File.basename path
  end

  def exists?
    @exists ||= File.exists? path
  end

private
  def existing_folder_is_directory
    unless exists?
      errors.add :base, "is not a directory" if File.directory?(path)
    end
  end

  def generate_secret
    self.secret ||= generator.digest "#{to_yaml}"
  end

  def create_folder
    `mkdir #{path}` unless exists?
    true
  end

  def generator
    @digest_generator ||= Digest::SHA1.new
  end
end
