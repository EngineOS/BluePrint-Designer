class AddakstoEnvironment < ActiveRecord::Migration
  def change
	add_column :environment_variables, :ask_at_runtime,:boolean
  end
end
