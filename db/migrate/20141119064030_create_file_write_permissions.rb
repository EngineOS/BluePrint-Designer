class CreateFileWritePermissions < ActiveRecord::Migration
  def change
    create_table :file_write_permissions do |t|
      t.string :title
      t.string :path
      t.boolean :recursive
      t.references :software, index: true

      t.timestamps
    end
  end
end
