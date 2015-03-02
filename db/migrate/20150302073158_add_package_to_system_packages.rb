class AddPackageToSystemPackages < ActiveRecord::Migration
  def change
    add_column :system_packages, :package, :string
  end
end