class ChangeenvironmentVariablesflds < ActiveRecord::Migration
  def change
   add_column :environment_variables, :mandatory, :boolean
  remove_column :environment_variables, :ask_at_runtime,:ask_at_buildtime
  add_column :environment_variables,:ask_at_buildtime,:boolean
  end
end
