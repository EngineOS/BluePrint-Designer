class AddtoReplacementStringsExtractDir < ActiveRecord::Migration
  def change
	 add_column :replacementstrings, :dest, :string
  end
end
