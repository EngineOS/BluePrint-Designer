class ServiceDefinition < ActiveRecord::Base
  # has_many :service_configurations
  belongs_to :publisher
  belongs_to :service_type
  # has_many :variables, as: :variable_consumer, dependent: :destroy
  # accepts_nested_attributes_for :variables, reject_if: :all_blank, allow_destroy: true

  # def to_handle
  #   publisher.to_label + ' ' + service_type.to_label
  # end

  def to_label
    publisher.to_label + ' ' + service_type.to_label
  end

end