class CreateActionators < ActiveRecord::Migration
  def change
    create_table :actionators do |t|
      t.integer :service_definition_id
      t.string  :name
      t.string  :label
      t.text    :description
      t.string  :return_type
      t.timestamps
    end
  end
end
