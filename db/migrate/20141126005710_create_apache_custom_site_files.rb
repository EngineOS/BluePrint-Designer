class CreateApacheCustomSiteFiles < ActiveRecord::Migration
  def change
    create_table :apache_custom_site_files do |t|
      t.string :name
      t.text :site_conf_content
      t.text :comment
      t.references :software, index: true

      t.timestamps
    end
  end
end
