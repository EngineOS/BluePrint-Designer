class Framework < ActiveRecord::Base
  has_many :software_versions
  belongs_to :language

  def to_handle
    name.downcase.gsub(' ', '_')
  end

  def to_label
    name
  end
  
end
