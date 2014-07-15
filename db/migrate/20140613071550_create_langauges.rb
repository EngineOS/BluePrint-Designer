class CreateLangauges < ActiveRecord::Migration
  def change
    create_table :langauges do |t|
      t.string :name
      t.text :comment

      t.timestamps
    end
  end
end
