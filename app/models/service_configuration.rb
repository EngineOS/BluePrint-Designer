require "#{Rails.root}/lib/SystemUtils.rb"
require "#{Rails.root}/lib/SysConfig.rb"
require "#{Rails.root}/lib/SoftwareServiceDefinition.rb"

class ServiceConfiguration < ActiveRecord::Base

  belongs_to :blueprint_version
  belongs_to :service_definition

  has_many :service_configuration_variables, dependent: :destroy
  has_many :variables, through: :service_configuration_variables

  # before_save :reload_service_variables

  # def to_handle
  #   publisher.to_handle + '_' + full_title.downcase.gsub(' ', '_')
  # end


  # def selectable_service_definitions
  #   Service.all.map{|service| service_definition.service_type}.select{|service| service_definition.accepts_managed_engine}
  # end

  def build_new
    valid? &&
    load_variables &&
    store_service_definition_keys &&
    save
  end

  def store_service_definition_keys
    self.service_definition_type_path = service_definition.service_type.path
    self.service_definition_publisher_namespace = service_definition.publisher.namespace
p :service_definition_type_path
p service_definition_type_path
    service_definition_type_path.present? && service_definition_publisher_namespace.present?
  end

  def reload_variables
    publisher_id = Publisher.where(namespace: service_definition_publisher_namespace)
    service_type_id = ServiceType.where(path: service_definition_type_path)
    service_definition_lookup = ServiceDefinition.find(publisher_id: publisher_id, service_type_id: service_type_id)
    return false if service_definition_lookup.nil?
    service_definition_id = service_definition_lookup.id
    load_variables
  end

  def to_label
    "#{service_definition_publisher_namespace} #{service_definition_type_path}" 
  end

  def as_json(options={})
    {
      publisher_namespace: service_definition.publisher.namespace,
      type_path: service_definition.service_type.path,
      variables: variables.map(&:name_value_pair).reduce(:merge)
    }
  end 

  # def service_from_file
  #   @service_from_file ||= SoftwareServiceDefinition.find service_definition.service_type.path, service_definition.publisher.namespace
  # end

  # def reload_service
  #   # if service != service_from_file.to_s
  #     # self.service = service_from_file.to_s
  #     reload_service_variables
  #   # end
  # end

  def load_variables
# p :SAVEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

    # save

p :service_definition_id
p service_definition_id


  # def reload_service_variables
    # if service_definition.present?
      service_definition_consumer_variables = service_definition.consumer.variables
      service_definition_consumer_variable_names = service_definition_consumer_variables.map{|variable| variable.name}

      existing_service_configuration_variable_names = variables.map(&:name)
      new_variable_names = service_definition_consumer_variable_names - existing_service_configuration_variable_names
      deprecated_variables = existing_service_configuration_variable_names - service_definition_consumer_variable_names

p :service_definition_consumer_variable_names
p service_definition_consumer_variable_names

p :existing_service_configuration_variable_names
p existing_service_configuration_variable_names

      new_variable_definitions = service_definition_consumer_variables.select { |variable| new_variable_names.include? variable.name }

      # new_variable_definitions.map { |variable| variable.select_collection = variable[:select_collection].to_s }
p :new_variable_names
p new_variable_names
      new_variable_definitions.each do |variable|
        new_service_configuration_variable = service_configuration_variables.build
        new_service_configuration_variable.save
        new_variable = variable.dup

p :new_variable
p new_variable.variable_consumer_id = new_service_configuration_variable.id
p new_variable.variable_consumer_type = 'ServiceConfigurationVariable'

new_variable.save


      #   variables.build.build_variable variable
      end

      # variables.each do |service_configuration_variable|
      #   variable = service_configuration_variable.variable
      #   variable_update_params = (service_definition_consumer_variables.find{ |variable_definition| variable.name == variable_definition[:name] } || {}).
      #                           slice(:value_confirmation, :label, :field_type, :select_collection, :tooltip, :hint, :placeholder, :comment, :regex_validator, :regex_invalid_message, :mandatory, :ask_at_build_time, :build_time_only, :immutable).
      #                           map { |key, value| { key => value.to_s } }.reduce(:merge)
      #   if variable_update_params.present?
      #     variable.update(variable_update_params)
      #     if deprecated_variables.include? variable.name 
      #       variable.update_attribute(:deprecated, true)
      #     end
      #   end
      # end
    # end
  end

end
