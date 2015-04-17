require "#{Rails.root}/lib/SystemUtils.rb"
require "#{Rails.root}/lib/SysConfig.rb"
require "#{Rails.root}/lib/SoftwareServiceDefinition.rb"

class ServiceConfiguration < ActiveRecord::Base

  belongs_to :blueprint_version
  belongs_to :service_definition

  has_many :service_configuration_variables, dependent: :destroy
  has_many :variables, through: :service_configuration_variables

  before_save :reload_service_definition_variables

  # def to_handle
  #   publisher.to_handle + '_' + full_title.downcase.gsub(' ', '_')
  # end

  def to_label
    service_definition.to_label
  end

  def as_json(options={})
    {
      publisher_namespace: service_definition.publisher.namespace,
      type_path: service_definition.service_type.path,
      variables: variables.as_json.reduce(:merge)
    }
  end 

  def service_definition_from_file
    @service_definition_from_file ||= SoftwareServiceDefinition.find service_definition.service_type.path, service_definition.publisher.namespace
  end

  # def reload_service_definition
  #   # if service_definition != service_definition_from_file.to_s
  #     # self.service_definition = service_definition_from_file.to_s
  #     reload_service_definition_variables
  #   # end
  # end

  def reload_service_definition_variables
    if service_definition_from_file.present?
      service_definition_variables = service_definition_from_file[:consumer_params].values
      service_definition_variable_names = service_definition_variables.map{|variable| variable[:name]}

      service_configuration_variable_names = service_configuration_variables.map(&:variable).map(&:name)

      new_variables = service_definition_variable_names - service_configuration_variable_names
      deprecated_variables = service_configuration_variable_names - service_definition_variable_names

      new_variable_definitions = service_definition_variables.select { |variable| new_variables.include? variable[:name] }

      new_variable_definitions.map { |variable| variable[:select_collection] = variable[:select_collection].to_s }

      new_variable_definitions.each do |variable|
        service_configuration_variables.build.build_variable variable
      end

      service_configuration_variables.each do |service_configuration_variable|
        variable = service_configuration_variable.variable
        variable_update_params = service_definition_variables.find{ |variable_definition| variable.name == variable_definition[:name] }.
                                slice(:value_confirmation, :label, :field_type, :select_collection, :tooltip, :hint, :placeholder, :comment, :regex_validator, :regex_invalid_message, :mandatory, :ask_at_build_time, :build_time_only, :immutable).
                                map { |key, value| { key => value.to_s } }.reduce(:merge)
        variable.update(variable_update_params)
        if deprecated_variables.include? variable.name 
          variable.update_attribute(:deprecated, true)
        end
      end
    end
  end

end
