class ServiceDefinitionCreateFromFiles

  def self.create_from(service_definition_file, readme_file='')
    new(service_definition_file, readme_file).import 
  end

  def initialize(service_definition_file, readme_file)
    @service_definition_file = service_definition_file
    @readme_file = readme_file
  end

  def yaml
    @yaml ||= YAML.load(@service_definition_file.gsub('!ruby/object:SoftwareServiceDefinition',''))
  end

  def accepts_for_import
    (yaml['accepts'] || []).
      reject{|accept| accept == 'ManagedEngine' || accept == 'ManagedService'}.
      map do |accept|
        service_type = ServiceType.where(path: accept).first_or_create
        { service_type_id: service_type.id }
      end
  end

  def setup_params_for_import
    yaml['setup_params'].present? ? {variables_attributes: yaml['setup_params'].values.map{|param| param['select_collection'] = param['select_collection'].to_s; param}} : {}
  end

  def consumer_params_for_import
    yaml['consumer_params'].present? ? {variables_attributes: yaml['consumer_params'].values.map{|param| param['select_collection'] = param['select_collection'].to_s; param}} : {}
  end

  def configurators_for_import
    if yaml['configurators'].present?
      yaml['configurators'].values.map do |configurator|
        configurator[:variables_attributes] = configurator['params'].values.map{|param| param['select_collection'] = param['select_collection'].to_s; param}
        configurator.except('params')
      end
    else
      []
    end
  end


  def publisher_id
    Publisher.where(namespace: yaml['publisher_namespace']).first_or_create.id
  end

  def service_type_id
    ServiceType.where(path: yaml['type_path']).first_or_create.id
  end


  def service_definition_params

p :yaml
p yaml
p yaml.class

      {
        accepts_attributes: accepts_for_import,
        title: yaml['title'] || 'No title',
        description: yaml['description'],
        major: yaml['version'].present? ? yaml['version']['major'] : 0,
        minor: yaml['version'].present? ? yaml['version']['minor'] : 0,
        release_level: yaml['version'].present? ? yaml['version']['release_level'] : 0,
        patch: yaml['version'].present? ? yaml['version']['patch'] : 0,
        service_container: yaml['service_container'],
        service_handle_field: yaml['service_handle_field'],
        dedicated: yaml['dedicated'] == true,
        persistant: yaml['persistant'] == true,
        immutable: yaml['immutable'] == true,
        attach_post_build: yaml['attach_post_build'] == true,
        attach_requires_restart: yaml['attach_requires_restart'] == true,
        readme: @readme_file,
        accepts_managed_engine: (yaml['accepts'] || []).include?('ManagedEngine'),
        accepts_managed_service: (yaml['accepts'] || []).include?('ManagedService'),
        setup_attributes: setup_params_for_import,
        consumer_attributes: consumer_params_for_import,
        configurators_attributes: configurators_for_import,
      }
  end

  def import
    publisher = Publisher.where(namespace: yaml['publisher_namespace'], name: yaml['author']).first_or_create
p :publisher_errors
p publisher.errors    
    service_type = ServiceType.where(path: yaml['type_path']).first_or_create
p :service_type_errors
p service_type.errors

    @record = ServiceDefinition.where(publisher_id: publisher.id, service_type_id: service_type.id).create

# @record.save
# p @record.errors

s = service_definition_params

p :service_definition_params
p s

p :record_id
p @record.class

    if @record.update(s)
p :yes
      true
    else
      @record.destroy
p :no      
      false
    end
  end

  # def repo_branch_list
  #   ['alpha', 'current', 'beta-rc']
  # end

  # def new_record?; true; end
  # def self.reflect_on_all_associations(args={}); []; end
  # def self.reflect_on_association(args={}); nil; end
  
end