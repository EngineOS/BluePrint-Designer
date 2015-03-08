class RenameApacheHttpdConfigurations < ActiveRecord::Migration
  def change
    rename_table :apache_httpd_conf_files, :apache_httpd_configurations
  end
end
