class AddExternalRepositoriesToFrameworks < ActiveRecord::Migration
  def change
    add_column :frameworks, :external_repositories, :boolean, default: false
  end
end
