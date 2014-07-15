class AddExtractoInstalledPackages < ActiveRecord::Migration
  def change
	add_column :installedpackages, :extractcmd,:string
  end
end
