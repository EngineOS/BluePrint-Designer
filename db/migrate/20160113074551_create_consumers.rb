class CreateConsumers < ActiveRecord::Migration
  def change
    create_table :consumers do |t|
      t.integer :service_definition_id
      t.timestamps
    end
  end
end
