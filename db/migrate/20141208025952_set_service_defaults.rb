class SetServiceDefaults < ActiveRecord::Migration
  def change
    change_column :environment_variables, :ask_at_build_time, :boolean, :default => false
    change_column :environment_variables, :mandatory, :boolean, :default => false
    change_column :environment_variables, :build_time_only, :boolean, :default => false
    
    
  end
end
