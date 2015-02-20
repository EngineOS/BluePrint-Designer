class Framework < ActiveRecord::Base
  has_many :software_versions
  belongs_to :language
end
