class Consumer < ActiveRecord::Base

  belongs_to :service_definition

  has_many :variables, as: :variable_consumer, dependent: :destroy
  accepts_nested_attributes_for :variables, reject_if: :all_blank, allow_destroy: true

  def to_label
    service_definition.to_label
  end

  # def variable_back_path
  #   "/service_definitions/#{service_definition.id}"
  # end

  # def nest_in
  #   service_definition
  # end


end
