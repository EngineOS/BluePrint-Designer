class CreateServicetypes < ActiveRecord::Migration
  def change
    create_table :servicetypes do |t|
      t.string :name
      t.text :comment

      t.timestamps
    end
  end
end
