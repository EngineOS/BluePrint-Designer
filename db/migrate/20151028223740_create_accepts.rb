class CreateAccepts < ActiveRecord::Migration
  def change
    create_table :accepts do |t|
      t.integer :service_definition_id
      t.integer :service_type_id
    end
  end
end
