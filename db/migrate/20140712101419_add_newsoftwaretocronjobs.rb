class AddNewsoftwaretocronjobs < ActiveRecord::Migration
  def change
 add_column :cron_jobs, :software_id,:integer
 add_index :cron_jobs,:software_id
  end
end
