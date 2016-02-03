class CreateCommitSettings < ActiveRecord::Migration
  def change
    create_table "commit_settings" do |t|
      t.string    "email"
      t.string    "name"
      t.timestamps
    end
  end
end
