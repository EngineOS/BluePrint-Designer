class RemoveLookupSystemValuesFromVariables < ActiveRecord::Migration
  def change
    remove_column :variables, :lookup_system_values
  end
end
