class BlueprintSave

  include ActiveModel::Model
  include ActiveModel::Validations

  # before_create :set_defaults

  def self.reflect_on_all_associations(scope); []; end
  def self.reflect_on_association(name); nil; end
  def self.columns_hash
    {
      blueprint_version_id: {type: :hidden},
      name: {label: 'Commit username', value: CommitSettings.instance.name},
      email: {label: 'User email address', value: CommitSettings.instance.email},
      message: {type: :text_area, label: 'Commit message'}
    }
  end
  def self.column_names
    columns_hash.keys
  end
  column_names.each { |name| attr_accessor name }
  def new_record?; true; end

  def save
    ::Repository::Repository.new.save_blueprint_version(
          blueprint_version_path,
          save_data.blueprint_version_json,
          save_data.blueprint_version_readme,
          name, email, message)
  end

  # def set_defaults
  #    = CommitSettings.instance
  # end


  def save_data
    BlueprintSaveData.new blueprint_version
  end

  def blueprint_version_path
    @blueprint_version_path ||=
      [
        publisher_namespace || 'no_publisher',
        blueprint_version.software_version.software.short_title.underscore.gsub(' ', '_') || 'no_software_short_title',
        blueprint_version.software_version.version.underscore.gsub(' ', '_') || 'no_software_version',
        blueprint_version.name.underscore.gsub(' ', '_') || 'no_blueprint_name'
      ].join '/'
  end

  def blueprint_version
    @blueprint_version ||= BlueprintVersion.find(blueprint_version_id)
  end

  def publisher_namespace
  namespace = blueprint_version.software_version.software.publisher.namespace
    if namespace == 'EnginesSystem'
      'engines'
    else
      namespace
    end
  end



  #
  # def setup_params_for_blueprint_version_hash
  #   {}.tap do |result|
  #     blueprint_version.setup.variables.as_json.each{|variable_param| result[(variable_param[:name] || 'MISSING_NAME!' )] = variable_param }
  #   end
  # end
  #
  # def consumer_params_for_blueprint_version_hash
  #   {}.tap do |result|
  #     blueprint_version.consumer.variables.as_json.each{|variable_param| result[(variable_param[:name] || 'MISSING_NAME!' )] = variable_param }
  #   end
  # end
  #
  # def configurators_for_blueprint_version_hash
  #   {}.tap do |result|
  #     blueprint_version.configurators.each do |configurator|
  #       result[configurator.name.to_sym] = configurator.as_json
  #       result[configurator.name.to_sym][:params] =
  #         {}.tap do |result|
  #           configurator.variables.as_json.each do |variable_param|
  #             result[(variable_param[:name] || 'MISSING_NAME!' )] = variable_param
  #           end
  #         end
  #     end
  #   end
  # end
  #
  # def accepts_for_blueprint_version_hash
  #   blueprint_version.accepts.as_json
  # end
  #
  # def humanize_html
  #   Humanizer::Blueprint.new(to_json, 'Service definition (v0.1)').html
  # end
  #
  # def blueprint_version_readme
  #   blueprint_version.readme
  # end
#
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
