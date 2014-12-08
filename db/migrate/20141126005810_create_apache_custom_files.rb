class CreateApacheCustomFiles < ActiveRecord::Migration
  def change
    create_table :apache_custom_files do |t|

      t.timestamps
    end
  end
end
