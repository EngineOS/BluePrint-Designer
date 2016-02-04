class ServiceDefinitionCommit

  include ActiveModel::Model
  include ActiveModel::Validations

  def self.reflect_on_all_associations(scope); []; end
  def self.reflect_on_association(name); nil; end
  def self.columns_hash
    {
      service_definition_id: {type: :hidden},
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
    ::Repository::Repository.new.save_service_definition(
          service_definition_path,
          save_data.service_definition_yaml,
          save_data.service_definition_readme,
          name, email, message)
  end

  def service_definition_path
    @service_definition_path ||= service_definition.publisher_namespace + '/' + service_definition.type_path
  end

  def save_data
    ServiceDefinitionCommitData.new service_definition
  end

  def service_definition
    @service_definition ||= ServiceDefinition.find(service_definition_id)
  end

end
