class AddSoftwareReferenceToPublishedSoftware < ActiveRecord::Migration
  def change
    add_reference :published_softwares, :software
  end
end
