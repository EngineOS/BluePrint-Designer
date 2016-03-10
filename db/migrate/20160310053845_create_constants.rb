class CreateConstants < ActiveRecord::Migration
  def change
    create_table :constants do |t|
      t.integer :service_definition_id
      t.string :name
      t.string :value
    end
  end
end
