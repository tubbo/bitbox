class Entity < ActiveRecord::Base
  validates :name, presence: true
  validates :path, presence: true
  validates :size, presence: true
end
