class CreateGenerates < ActiveRecord::Migration
  def change
    create_table :generates do |t|
      t.string :model
      t.string :cronjob
      t.text :description

      t.timestamps
    end
  end
end
