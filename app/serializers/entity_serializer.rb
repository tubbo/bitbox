class EntitySerializer < ActiveModel::Serializer
  attributes :id, :name, :path, :size, :last_modified_at
end
