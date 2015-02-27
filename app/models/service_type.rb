class ServiceType < ActiveRecord::Base
  has_many :service_definitions, dependent: :destroy

  def to_handle
    name.downcase.gsub(' ', '_')
  end

  def to_label
    name
  end
  
end