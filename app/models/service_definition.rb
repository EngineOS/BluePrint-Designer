class ServiceDefinition < ActiveRecord::Base

  belongs_to :publisher
  belongs_to :service_type

  has_one :setup, dependent: :destroy
  has_one :consumer, dependent: :destroy
  has_many :configurators, dependent: :destroy
  has_many :accepts, dependent: :destroy

  accepts_nested_attributes_for :accepts
  accepts_nested_attributes_for :configurators
  accepts_nested_attributes_for :setup
  accepts_nested_attributes_for :consumer

  before_create :build_nested_records

  enum release_level: { :Alpha => 0, :Beta => 1, :'Release candidate' => 2, :Release => 3}

  validates :publisher_namespace, presence: true
  validates :type_path, presence: true
  validates :title, presence: true

  # def self.load_for(service_definition_path)
  #   first_or_create.tap do |service_definition|
  #     service_definition.clear_nested_records
  #     service_definition.update(
  #       Repository::ServiceDefinition::Load.new(service_definition_path).attributes )
  #   end
  # end

  def to_label
    publisher_namespace.to_s + '/' + type_path.to_s + ' (' + title.to_s + ')'
  end

  def edited?
    created_at != updated_at
  end

  def service_definition_save
    @service_definition_save ||= ServiceDefinitionSave.new(self)
  end

  def save_to_repository
    service_definition_save.save
  end

  def pretty_print
    service_definition_save.service_definition_yaml
  end

  private

  def build_nested_records
    build_setup if setup.nil?
    build_consumer if consumer.nil?
 end

end
