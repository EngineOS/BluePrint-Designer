class CreateApacheModules < ActiveRecord::Migration
  def change
    create_table :apache_modules do |t|
      t.string :module
      t.text :comment
      t.references :software, index: true

      t.timestamps
    end
  end
end
