class CreateSoftwareservices < ActiveRecord::Migration
  def change
    create_table :softwareservices do |t|
      t.string :name
      t.text :comment
      t.references :servicetype, index: true
      t.references :software, index: true

      t.timestamps
    end
  end
end
