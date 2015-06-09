class CreateBlueprintModules < ActiveRecord::Migration
  def change
    create_table :blueprint_modules do |t|
      t.integer :blueprint_version_id
      t.integer :module_type_id
      t.string  :os_package
      t.string  :module_name
      t.timestamps
    end
  end
end
