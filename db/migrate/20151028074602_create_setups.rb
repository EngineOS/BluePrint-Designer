class CreateSetups < ActiveRecord::Migration
  def change
    create_table :setups do |t|
      t.integer :service_definition_id
    end
  end
end
