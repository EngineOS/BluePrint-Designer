class RenameActionatorsToServiceActionators < ActiveRecord::Migration
  def change
    rename_table :actionators, :service_actionators
  end
end
