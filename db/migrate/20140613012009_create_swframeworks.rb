class CreateSwframeworks < ActiveRecord::Migration
  def change
    create_table :swframeworks do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
