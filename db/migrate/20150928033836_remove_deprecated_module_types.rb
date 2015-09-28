class RemoveDeprecatedModuleTypes < ActiveRecord::Migration
  def change
    drop_table :apache_modules
    drop_table :pear_modules
  end
end
