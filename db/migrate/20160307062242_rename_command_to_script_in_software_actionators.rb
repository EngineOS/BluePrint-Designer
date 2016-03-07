class RenameCommandToScriptInSoftwareActionators < ActiveRecord::Migration
  def change
    rename_column :software_actionators, :command, :script
  end
end
