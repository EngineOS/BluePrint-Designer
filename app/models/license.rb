class License < ActiveRecord::Base

  has_many :software_versions

  def to_handle
    name.downcase.gsub(' ', '_')
  end

  def to_label
    name
  end

end
