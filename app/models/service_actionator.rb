class ServiceActionator < ActiveRecord::Base

  belongs_to :service_definition

  has_many :variables, as: :variable_consumer, dependent: :destroy
  accepts_nested_attributes_for :variables, reject_if: :all_blank, allow_destroy: true

  # def as_json(options={})
  #   options[:except] ||= [:created_at, :updated_at, :id, :service_definition_id]
  #   super
  # end

end
