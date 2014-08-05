class AddDesttosoftwareservices < ActiveRecord::Migration
  def change
	add_column :softwareservices, :dest, :string
  end
end
