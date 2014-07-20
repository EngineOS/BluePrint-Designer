class CreateWorkerCommands < ActiveRecord::Migration
  def change
    create_table :worker_commands do |t|
      t.string :command
      t.string :name
      t.text :comment

      t.timestamps
    end
  end
end
