class Worker < ActiveRecord::Base
  belongs_to :blueprint_version

  def to_label
    name
  end

end
