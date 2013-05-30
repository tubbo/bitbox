require 'digest'

class Folder < ActiveRecord::Base
  before_validation :generate_secret

  validates :name,    presence: true, uniqueness: true
  validates :secret,  presence: true

  after_validation :create_folder

private
  def generate_secret
    self.secret ||= generator.digest source_of_secret
  end

  def create_folder
    `mkdir #{path}` unless File.exists? path
    true
  end

  def generator
    @digest_generator ||= Digest::SHA256.new
  end

  def source_of_secret
    "#{self.name} #{self.created_at}"
  end

  def path
    "#{Rails.application.config.sync_folder}/#{name}"
  end
end
