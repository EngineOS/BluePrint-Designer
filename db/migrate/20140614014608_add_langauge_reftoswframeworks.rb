class AddLangaugeReftoswframeworks < ActiveRecord::Migration
  def change
    add_reference :swframeworks, :langauge 
  end
end
