class Accept < ActiveRecord::Base

  belongs_to :service_definition
  belongs_to :service_type

  # def to_label
  #   publisher.to_label + ' ' + service_type.to_label
  # end

  def as_json(options={})
    service_type.path
  end

end