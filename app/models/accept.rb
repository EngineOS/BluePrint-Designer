class Accept < ActiveRecord::Base

  belongs_to :service_definition
  belongs_to :service_type
  has_one :type_consumer, dependent: :destroy

  before_create :build_type_consumer

  def type_consumer
    super || build_type_consumer
  end

  # def to_label
  #   publisher.to_label + ' ' + service_type.to_label
  # end

  # def as_json(options={})
  #   accepts_type
  # end

end
