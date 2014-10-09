class CreateRakeTasks < ActiveRecord::Migration
  def change
    create_table :rake_tasks do |t|
      t.string :name
      t.string :action

      t.timestamps
    end
  end
end
