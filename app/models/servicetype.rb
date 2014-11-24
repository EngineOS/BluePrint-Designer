class Servicetype < ActiveRecord::Base
  has_many :servicetypes
  has_many :service_type_environment_variables
end
