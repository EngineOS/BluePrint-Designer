class AddtoextractdirTopackages < ActiveRecord::Migration
  def change
	 add_column :installedpackages , :extractdir, :string

  end
end
