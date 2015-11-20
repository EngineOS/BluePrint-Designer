class ServiceDefinition < ActiveRecord::Base

  belongs_to :publisher
  belongs_to :service_type

  validates :publisher, :service_type, presence: true

  has_one :setup, dependent: :destroy
  has_one :consumer, dependent: :destroy
  has_many :configurators, dependent: :destroy
  has_many :accepts, dependent: :destroy

  accepts_nested_attributes_for :accepts
  accepts_nested_attributes_for :configurators
  accepts_nested_attributes_for :setup
  accepts_nested_attributes_for :consumer

  enum release_level: { :Alpha => 0, :Beta => 1, :'Release candidate' => 2, :Release => 3} 

  before_create :build_setup
  before_create :build_consumer

  def to_label
    "#{publisher.namespace} #{service_type.path}"
  end

  def as_json(options={})
    clean_data({
      'type_path' => service_type.path,
      'publisher_namespace' => publisher.namespace,
      'accepts' => accepts_for_as_json,
      'author' => publisher.name,
      'title' => title,
      'description' => description,
      'major' => major,
      'minor' => minor,
      'release_level' => release_level,
      'patch' => patch,
      'service_container' => service_container,
      'service_handle_field' => service_handle_field,
      'dedicated' => dedicated,
      'persistant' => persistant,
      'immutable' => immutable,
      'attach_post_build' => attach_post_build,
      'attach_requires_restart' => attach_requires_restart,
      'setup_params' => setup_params_for_as_json,
      'consumer_params' => consumer_params_for_as_json,
      'configurators' => configurators_for_as_json,
    })
  end

  def setup_params_for_as_json
    {}.tap do |result|
      setup.variables.as_json.each{|variable_param| result[variable_param['name']] = variable_param }
    end
  end

  def consumer_params_for_as_json
    {}.tap do |result|
      consumer.variables.as_json.each{|variable_param| result[variable_param['name']] = variable_param }
    end
  end

  def configurators_for_as_json
    {}.tap do |result|
      configurators.each do |configurator|
        result[configurator.name] = configurator.as_json
        result[configurator.name]['params'] = 
          {}.tap do |result|
            configurator.variables.as_json.each do |variable_param|
              result[variable_param['name']] = variable_param
            end
          end
      end
    end
  end

  def accepts_for_as_json
    accepts.as_json.tap do |result|
     result << 'ManagedEngine' if accepts_managed_engine
     result << 'ManagedService' if accepts_managed_service
    end
  end

  def humanize_html
    Humanizer::Blueprint.new(to_json, 'Service definition (v0.1)').html
  end

private

  def clean_data(dirty_data)
    if dirty_data.is_a? Array
      dirty_data.map do |v|
        clean_data v
      end.compact
    elsif dirty_data.is_a? Hash
      {}.tap do |result|
        dirty_data.map do |k, v|
          v = clean_data v
          result[k] = clean_data v if v.present?
        end
      end
    elsif dirty_data.is_a? String
      dirty_data.strip
    else
      dirty_data
    end
  end


end