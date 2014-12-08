class CreateApacheHttpdConfFiles < ActiveRecord::Migration
  def change
    create_table :apache_httpd_conf_files do |t|
      t.string :name
      t.text :httpd_conf_content
      t.text :comment
      t.references :software, index: true

      t.timestamps
    end
  end
end
