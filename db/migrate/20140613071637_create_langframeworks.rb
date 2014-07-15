class CreateLangframeworks < ActiveRecord::Migration
  def change
    create_table :langframeworks do |t|
      t.string :name
      t.text :comment
      t.references :langauge, index: true

      t.timestamps
    end
  end
end
