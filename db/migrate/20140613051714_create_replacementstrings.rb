class CreateReplacementstrings < ActiveRecord::Migration
  def change
    create_table :replacementstrings do |t|
      t.string :sedstr
      t.string :file
      t.text :comment
      t.references :software, index: true

      t.timestamps
    end
  end
end
