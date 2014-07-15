class AddLangaugetoSoftware < ActiveRecord::Migration
  def change
	add_reference :softwares,  :langauge

  end
end
