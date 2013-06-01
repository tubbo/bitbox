class AddFolderIdToEntities < ActiveRecord::Migration
  def change
    add_column :entities, :folder_id, :integer
  end
end
