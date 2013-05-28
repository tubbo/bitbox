class Entity < ActiveRecord::Base
  validates :name, presence: true
  mount_uploader :name, EntityUploader
end
