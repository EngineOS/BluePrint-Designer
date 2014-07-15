class CreateOspackages < ActiveRecord::Migration
  def change
    create_table :ospackages do |t|
      t.string :name
      t.text :comment
      t.references :software, index: true

      t.timestamps
    end
  end
end
