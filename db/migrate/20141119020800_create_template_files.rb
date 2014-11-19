class CreateTemplateFiles < ActiveRecord::Migration
  def change
    create_table :template_files do |t|
      t.string :title
      t.string :path
      t.text :content
      t.references :software, index: true

      t.timestamps
    end
  end
end
