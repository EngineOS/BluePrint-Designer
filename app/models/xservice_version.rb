class ServiceVersion < ActiveRecord::Base

  attr_accessor :_destroy

  belongs_to :service
  has_many :service_definitions, dependent: :destroy

  # def to_handle
  #   publisher.to_label + ' ' + service_type.to_label
  # end

  def to_label
    service.publisher.to_label + ' ' + service.service_type.to_label + ' ' + version
  end

end