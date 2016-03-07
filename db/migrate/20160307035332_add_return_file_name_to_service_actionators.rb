class AddReturnFileNameToServiceActionators < ActiveRecord::Migration
  def change
    add_column :service_actionators, :return_file_name, :string
  end
end
