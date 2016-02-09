class CreateTypeConsumers < ActiveRecord::Migration
  def change
    create_table :type_consumers do |t|
      t.integer :accept_id
    end
  end
end
