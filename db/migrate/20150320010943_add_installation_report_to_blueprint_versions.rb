class AddInstallationReportToBlueprintVersions < ActiveRecord::Migration
  def change
    add_column :blueprint_versions, :installation_report_template, :text
  end
end
