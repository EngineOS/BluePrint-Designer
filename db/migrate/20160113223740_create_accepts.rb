class CreateAccepts < ActiveRecord::Migration
  def change
    create_table :accepts do |t|
      t.integer :service_definition_id
      t.string :accepts_type
      t.timestamps
    end
  end
end
