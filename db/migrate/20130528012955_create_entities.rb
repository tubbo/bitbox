class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :name
      t.string :path
      t.string :size
      t.datetime :last_modified_at

      t.timestamps
    end
  end
end
