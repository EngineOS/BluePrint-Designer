class CreateServiceDefinitionCommits < ActiveRecord::Migration
  def change
    create_table :service_definition_commits do |t|
      t.integer :service_definition_id
    end
  end
end
