class FixTypoPersistent < ActiveRecord::Migration
  def change
    rename_column :service_definitions, :persistant, :persistent
  end
end
