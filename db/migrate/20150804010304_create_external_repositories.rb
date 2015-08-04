class CreateExternalRepositories < ActiveRecord::Migration
  def change
    create_table :external_repositories do |t|
      t.integer :blueprint_version_id
      t.string :repository
    end
  end
end
