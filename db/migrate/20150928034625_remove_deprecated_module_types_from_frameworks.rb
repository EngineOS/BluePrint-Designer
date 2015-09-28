class RemoveDeprecatedModuleTypesFromFrameworks < ActiveRecord::Migration
  def change
    remove_column :frameworks, :pear_modules
    remove_column :frameworks, :apache_modules
  end
end
