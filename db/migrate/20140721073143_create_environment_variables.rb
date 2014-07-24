class CreateEnvironmentVariables < ActiveRecord::Migration
  def change
    create_table :environment_variables do |t|
      t.text :name
      t.string :value
      t.string :comment
      t.references :software, index: true

      t.timestamps
    end
  end
end
