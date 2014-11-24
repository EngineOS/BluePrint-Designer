class AddSetupScriptToSoftware < ActiveRecord::Migration
  def change
    add_column :softwares, :custom_start_script, :text
    add_column :softwares, :custom_install_script, :text
    add_column :softwares, :custom_post_install_script, :text
  end
end
