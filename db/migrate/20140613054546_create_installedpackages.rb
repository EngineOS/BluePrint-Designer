class CreateInstalledpackages < ActiveRecord::Migration
  def change
    create_table :installedpackages do |t|
      t.string :name
      t.string :src
      t.string :dest
      t.text :comment
      t.references :software, index: true

      t.timestamps
    end
  end
end
