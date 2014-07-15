class Addownerframeworksreferencestosoftware < ActiveRecord::Migration
  def change
    add_reference :softwares,  :license
    add_reference :softwares,  :owner
    add_reference :softwares,  :swframework

  end
end
