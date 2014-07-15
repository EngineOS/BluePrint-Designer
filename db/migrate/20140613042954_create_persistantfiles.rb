class CreatePersistantfiles < ActiveRecord::Migration
  def change
    create_table :persistantfiles do |t|
      t.string :path
      t.text :comment
      t.references :software, index: true

      t.timestamps
    end
  end
end
