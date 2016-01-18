class CreateConfigurators < ActiveRecord::Migration
  def change
    create_table :configurators do |t|
      t.integer :service_definition_id
      t.string  :name
      t.string  :label
      t.text    :description
      t.boolean :no_save
      t.timestamps
    end
  end
end
