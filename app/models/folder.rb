require 'btsync'

# Represents a single folder on the host machine that is being
# synchronized over BtSync. Includes a handler that can execute commands
# on the Linux client app.
class Folder < ActiveRecord::Base
  before_validation :create_folder_and_populate_secret

  validates :name,    presence: true, uniqueness: true
  validates :secret,  presence: true
  validate  :folder_is_directory
  validate  :directory_was_synced

  # Compute an absolute path to the folder.
  def path
    @path ||= File.expand_path name
  end

  def basename
    @basename ||= File.basename path
  end

  # Test if the folder path exists on the host machine.
  def exists?
    @exists ||= File.exists? path
  end

  # Register the folder with the BtSync app, or instantiate a new BtSync
  # instance to perform operations such as preference changes on the
  # folder.
  def directory
    @directory ||= BtSync.new.add_folder name, secret
  end

private
  def folder_is_directory
    errors.add :base, "is not a directory" if File.directory?(path)
  end

  def directory_was_synced
    errors.add :directory, "could not be registered with BtSync" \
      unless directory.present?
  end

  def generate_secret
    self.secret ||= generator.digest "#{to_yaml}"
  end

  def create_folder_and_populate_secret
    create_folder and populate_secret
  end

  def create_folder
    return true if exists?
    `mkdir #{path}` == ""
  end

  def populate_secret
    if directory.present? & secret.nil?
      self.secret = directory.secret
    else
      secret.present?
    end
  end
end
