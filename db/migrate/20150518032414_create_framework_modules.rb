class CreateFrameworkModules < ActiveRecord::Migration
  def change
    create_table :framework_modules do |t|
      t.integer :framework_id
      t.integer :module_type_id
      t.timestamps
    end
  end
end
