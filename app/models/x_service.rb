class Service < ActiveRecord::Base

  belongs_to :publisher
  belongs_to :service_type
  has_many :service_definitions, dependent: :destroy

  validates :publisher, :service_type, presence: true

  def to_label
    "#{publisher.to_label} #{service_type.to_label} (#{publisher.namespace}/#{service_type.path})"
  end

  # def to_handle
  #   to_label.gsub(' ', '_')
  # end

end