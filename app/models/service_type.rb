class ServiceType < ActiveRecord::Base
  has_many :service_blueprints, dependent: :destroy
end