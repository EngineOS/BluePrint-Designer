class ServiceConfiguration < ActiveRecord::Base

  belongs_to :blueprint_version
  belongs_to :service_blueprint

  has_many :variables, as: :variable_consumer, dependent: :destroy

end
