class TypeConsumer  < ActiveRecord::Base

  belongs_to :accept

  has_many :variables, as: :variable_consumer, dependent: :destroy
  accepts_nested_attributes_for :variables, reject_if: :all_blank, allow_destroy: true

end
