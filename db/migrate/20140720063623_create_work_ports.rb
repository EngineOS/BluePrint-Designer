class CreateWorkPorts < ActiveRecord::Migration
  def change
    create_table :work_ports do |t|
      t.integer :port
      t.string :name
      t.text :comment

      t.timestamps
    end
  end
end
