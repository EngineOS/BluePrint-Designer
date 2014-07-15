class CreateSoftwaredeploytypes < ActiveRecord::Migration
  def change
    create_table :softwaredeploytypes do |t|
      t.string :name
      t.text :comment

      t.timestamps
    end
  end
end
