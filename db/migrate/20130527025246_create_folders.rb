class CreateFolders < ActiveRecord::Migration
  def change
    create_table :folders do |t|
      t.string :name
      t.string :secret

      t.timestamps
    end
  end
end
