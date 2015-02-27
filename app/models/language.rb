class Language < ActiveRecord::Base

  has_many :software_versions
  has_many :frameworks

  def to_handle
    name.downcase.gsub(' ', '_')
  end

  def to_label
    name
  end

end
