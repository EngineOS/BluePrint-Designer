class ServiceDefinitionSave

  attr_accessor :service_definition

  def initialize(service_definition)
    @service_definition = service_definition
  end

  def save
    ::Repository::Repository.new.save_service_definition(service_definition_path, service_definition_yaml, service_definition_readme)
  end

  def service_definition_path
    service_definition.publisher_namespace + '/' + service_definition.type_path
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
      persistant: service_definition.persistant,
      immutable: service_definition.immutable,
      attach_post_build: service_definition.attach_post_build,
      attach_requires_restart: service_definition.attach_requires_restart,
      setup_params: setup_params_for_service_definition_hash,
      consumer_params: consumer_params_for_service_definition_hash,
      configurators: configurators_for_service_definition_hash,
    }
  end

  def accepts_for_service_definition_hash
    service_definition.accepts.map(&:accepts_type)
  end

  def setup_params_for_service_definition_hash
    service_definition.setup.variables.map do |variable|
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
    end.reduce(:merge)
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
        result[configurator.name.to_sym][:variables] =
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
