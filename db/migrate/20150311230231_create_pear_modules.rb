class CreatePearModules < ActiveRecord::Migration
  def change
    create_table :pear_modules do |t|
      t.string   :os_package
      t.string   :module
      t.integer  :blueprint_version_id
      t.timestamps
    end

    add_column :frameworks, :pear_modules, :boolean, default: false

  end
end
