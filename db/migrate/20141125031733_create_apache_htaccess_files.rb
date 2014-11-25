class CreateApacheHtaccessFiles < ActiveRecord::Migration
  def change
    create_table :apache_htaccess_files do |t|
      t.string :directory
      t.text :htaccess_content
      t.text :comment
      t.references :software, index: true

      t.timestamps
    end
  end
end
