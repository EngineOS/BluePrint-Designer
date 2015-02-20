class Publisher < ActiveRecord::Base
  has_many :service_blueprints, dependent: :destroy
  has_many :softwares, dependent: :destroy
end
