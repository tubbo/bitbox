# encoding: utf-8

class EntityUploader < CarrierWave::Uploader::Base
  include Sprockets::Helpers::RailsHelper

  storage :file

  def store_dir
    "uploads/#{mounted_as}/#{model.id}"
  end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end
end
