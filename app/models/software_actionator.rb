class SoftwareActionator < ActiveRecord::Base

  belongs_to :blueprint_version

  has_many :variables, as: :variable_consumer, dependent: :destroy
  accepts_nested_attributes_for :variables, reject_if: :all_blank, allow_destroy: true

end
