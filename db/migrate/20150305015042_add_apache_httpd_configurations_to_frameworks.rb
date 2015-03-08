class AddApacheHttpdConfigurationsToFrameworks < ActiveRecord::Migration
  def change
    add_column :frameworks, :apache_httpd_configurations, :boolean, default: true
  end
end
