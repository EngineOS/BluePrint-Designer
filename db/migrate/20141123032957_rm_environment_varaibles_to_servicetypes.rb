class RmEnvironmentVaraiblesToServicetypes < ActiveRecord::Migration
  def change
    remove_column :servicetypes, :environment_variable_id
  end
end
