class AddLogFieldToServiceActionators < ActiveRecord::Migration
  def change
    add_column :service_actionators, :log, :boolean
  end
end
