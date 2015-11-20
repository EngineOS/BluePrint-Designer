class Consumer < ActiveRecord::Base
  
  belongs_to :service_definition

  has_many :variables, as: :variable_consumer, dependent: :destroy
  accepts_nested_attributes_for :variables, reject_if: :all_blank, allow_destroy: true

  # def to_label
  #   publisher.to_label + ' ' + service_type.to_label
  # end

end