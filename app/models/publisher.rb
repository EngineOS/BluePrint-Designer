class Publisher < ActiveRecord::Base
  has_many :service_definitions, dependent: :destroy
  has_many :softwares, dependent: :destroy

  def to_handle
    name.downcase.gsub(' ', '_')
  end

  def to_label
    name
  end

end
