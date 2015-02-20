class License < ActiveRecord::Base

  has_many :software_versions
  
end
