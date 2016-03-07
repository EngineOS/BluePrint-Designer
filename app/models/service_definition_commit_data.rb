class ServiceDefinitionCommitData

  attr_accessor :service_definition

  def initialize(service_definition)
    @service_definition = service_definition
  end

  def service_definition_yaml
    service_definition_hash.deep_stringify_keys!.to_yaml
  end

  def service_definition_hash
    {
      type_path: service_definition.type_path,
      publisher_namespace: service_definition.publisher_namespace,
      accepts: accepts_for_service_definition_hash,
      author: service_definition.author,
      title: service_definition.title,
      description: service_definition.description,
      major: service_definition.major,
      minor: service_definition.minor,
      release_level: service_definition.release_level,
      patch: service_definition.patch,
      service_container: service_definition.service_container,
      service_handle_field: service_definition.service_handle_field,
      dedicated: service_definition.dedicated,
      persistent: service_definition.persistent,
      immutable: service_definition.immutable,
      attach_post_build: service_definition.attach_post_build,
      attach_requires_restart: service_definition.attach_requires_restart,
      target_environment_variables: target_envs_for_service_definition_hash,
      consumer_params: consumer_params_for_service_definition_hash,
      type_consumer_params: type_consumer_params_for_service_definition_hash,
      configurators: configurators_for_service_definition_hash,
      service_actionators: service_actionators_for_service_definition_hash,
    }
  end

  def accepts_for_service_definition_hash
    service_definition.accepts.map(&:accepts_type)
  end

  def target_envs_for_service_definition_hash
    service_definition.target_envs.map do |target_env|
      {
        target_env.environment_name.to_sym =>
          {
            environment_name: target_env.environment_name,
            variable_name: target_env.variable_name
           }
      }
    end.reduce(:merge)
  end

  def consumer_params_for_service_definition_hash
    service_definition.consumer.variables.map do |variable|
      {
        variable.name.to_sym =>
          {
            name: variable.name,
            value: variable.value,
            label: variable.label,
            field_type: variable.field_type,
            select_collection: variable.select_collection,
            tooltip: variable.tooltip,
            hint: variable.hint,
            placeholder: variable.placeholder,
            comment: variable.comment,
            regex_validator: variable.regex_validator,
            regex_invalid_message: variable.regex_invalid_message,
            mandatory: variable.mandatory,
            ask_at_build_time: variable.ask_at_build_time,
            build_time_only: variable.build_time_only,
            immutable: variable.immutable
           }
      }
    end.reduce(:merge) || {}
  end

  def type_consumer_params_for_service_definition_hash
    {}.tap do |result|
      service_definition.accepts.each do |accepts|
        next if accepts.type_consumer.variables.empty?
        result[accepts.accepts_type.to_sym] =
            accepts.type_consumer.variables.map do |variable|
            {
              variable.name.to_sym =>
                {
                  name: variable.name,
                  value: variable.value,
                  label: variable.label,
                  field_type: variable.field_type,
                  select_collection: variable.select_collection,
                  tooltip: variable.tooltip,
                  hint: variable.hint,
                  placeholder: variable.placeholder,
                  comment: variable.comment,
                  regex_validator: variable.regex_validator,
                  regex_invalid_message: variable.regex_invalid_message,
                  mandatory: variable.mandatory,
                  ask_at_build_time: variable.ask_at_build_time,
                  build_time_only: variable.build_time_only,
                  immutable: variable.immutable
                 }
            }
          end.reduce(:merge)
      end
    end
  end

  def configurators_for_service_definition_hash
    {}.tap do |result|
      service_definition.configurators.each do |configurator|
        result[configurator.name.to_sym] =
        {
          name: configurator.name,
          label: configurator.label,
          description: configurator.description,
          no_save: configurator.no_save
        }
        result[configurator.name.to_sym][:params] =
          configurator.variables.map do |variable|
            {
              variable.name.to_sym =>
                {
                  name: variable.name,
                  value: variable.value,
                  label: variable.label,
                  field_type: variable.field_type,
                  select_collection: variable.select_collection,
                  tooltip: variable.tooltip,
                  hint: variable.hint,
                  placeholder: variable.placeholder,
                  comment: variable.comment,
                  regex_validator: variable.regex_validator,
                  regex_invalid_message: variable.regex_invalid_message,
                  mandatory: variable.mandatory,
                  ask_at_build_time: variable.ask_at_build_time,
                  build_time_only: variable.build_time_only,
                  immutable: variable.immutable
                 }
            }
          end.reduce(:merge)
      end
    end
  end

  def service_actionators_for_service_definition_hash
    {}.tap do |result|
      service_definition.service_actionators.each do |service_actionator|
        result[service_actionator.name.to_sym] =
        {
          name: service_actionator.name,
          label: service_actionator.label,
          description: service_actionator.description,
          return_type: service_actionator.return_type,
          return_file_name: service_actionator.return_file_name
        }
        result[service_actionator.name.to_sym][:params] =
          service_actionator.variables.map do |variable|
            {
              variable.name.to_sym =>
                {
                  name: variable.name,
                  value: variable.value,
                  label: variable.label,
                  field_type: variable.field_type,
                  select_collection: variable.select_collection,
                  tooltip: variable.tooltip,
                  hint: variable.hint,
                  placeholder: variable.placeholder,
                  comment: variable.comment,
                  regex_validator: variable.regex_validator,
                  regex_invalid_message: variable.regex_invalid_message,
                  mandatory: variable.mandatory,
                  ask_at_build_time: variable.ask_at_build_time,
                  build_time_only: variable.build_time_only,
                  immutable: variable.immutable
                 }
            }
          end.reduce(:merge)
      end
    end
  end

  # def humanize_html
  #   Humanizer::Blueprint.new(to_json, 'Service definition (v0.1)').html
  # end

  def service_definition_readme
    service_definition.readme
  end

# private
#
#   def clean_data(dirty_data)
#     if dirty_data.is_a? Array
#       dirty_data.map do |v|
#         clean_data v
#       end.compact
#     elsif dirty_data.is_a? Hash
#       {}.tap do |result|
#         dirty_data.map do |k, v|
#           v = clean_data v
#           result[k] = clean_data v if v.present?
#         end
#       end
#     elsif dirty_data.is_a? String
#       dirty_data.strip
#     else
#       dirty_data
#     end
#     dirty_data
#   end

end
