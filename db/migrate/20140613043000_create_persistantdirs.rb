class CreatePersistantdirs < ActiveRecord::Migration
  def change
    create_table :persistantdirs do |t|
      t.string :path
      t.text :comment
      t.references :software, index: true

      t.timestamps
    end
  end
end
