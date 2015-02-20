class Language < ActiveRecord::Base

  has_many :software_versions
  has_many :frameworks

end
