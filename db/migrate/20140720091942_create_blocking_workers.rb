class CreateBlockingWorkers < ActiveRecord::Migration
  def change
    create_table :blocking_workers do |t|
      t.string :command
      t.string :name
      t.text :comment

      t.timestamps
    end
  end
end
