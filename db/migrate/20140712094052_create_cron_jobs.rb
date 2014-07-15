class CreateCronJobs < ActiveRecord::Migration
  def change
    create_table :cron_jobs do |t|
      t.string :cronjob
      t.text :description

      t.timestamps
    end
  end
end
