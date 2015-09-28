class CreateBlueprintCommits < ActiveRecord::Migration
  def change
    create_table :blueprint_commits do |t|
      t.integer :blueprint_version_id
    end
  end
end
