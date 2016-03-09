class AddLogFieldToSoftwareActionators < ActiveRecord::Migration
  def change
    add_column :software_actionators, :log, :boolean
  end
end
