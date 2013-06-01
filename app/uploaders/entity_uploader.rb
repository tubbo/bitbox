# encoding: utf-8

class EntityUploader < CarrierWave::Uploader::Base
  include Sprockets::Helpers::RailsHelper

  storage :file

  def store_dir
    "#{model.folder}/#{model.name}"
  end
end
