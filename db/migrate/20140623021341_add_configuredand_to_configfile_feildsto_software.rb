class AddConfiguredandToConfigfileFeildstoSoftware < ActiveRecord::Migration
  def change
	add_column :softwares, :toconfigurefile, :string
	add_column :softwares, :configuredfile, :string
  end
end
