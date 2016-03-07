class CreateSoftwareActionators < ActiveRecord::Migration
  def change
    create_table :software_actionators do |t|
      t.integer :blueprint_version_id
      t.string :name
      t.text :command
      t.string :label
      t.text :description
      t.string :return_type
      t.string :return_file_name
    end
  end
end
