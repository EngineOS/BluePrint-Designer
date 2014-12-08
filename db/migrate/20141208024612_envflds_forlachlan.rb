class EnvfldsForlachlan < ActiveRecord::Migration
  def change
    add_column :environment_variables, :label, :string
    # remove_column :environment_variables, :ask_at_buildtime
     add_column :environment_variables,:ask_at_build_time,:boolean
  end
end
