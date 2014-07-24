class AddEnvirontoSoftware < ActiveRecord::Migration
  def change
	add_reference :softwares,  :environment_variable
  end
end
