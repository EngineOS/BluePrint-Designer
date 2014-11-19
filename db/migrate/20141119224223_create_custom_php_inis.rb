class CreateCustomPhpInis < ActiveRecord::Migration
  def change
    create_table :custom_php_inis do |t|
      t.string :title
      t.text :content
      t.references :software
      t.timestamps
    end
  end
end
