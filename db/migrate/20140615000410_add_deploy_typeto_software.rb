class AddDeployTypetoSoftware < ActiveRecord::Migration
  def change
	add_reference :softwares,  :softwaredeploytype
  end
end
