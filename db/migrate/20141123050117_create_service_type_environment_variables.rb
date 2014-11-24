class CreateServiceTypeEnvironmentVariables < ActiveRecord::Migration
  def change
    create_table :service_type_environment_variables do |t|
      t.string :name
      t.string :value
      t.text :comment
      t.boolean :ask_at_runtime
      t.references :servicetype, index: true

      t.timestamps
    end
  end
end
