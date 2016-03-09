class ServiceDefinitionsCommit

  include ActiveModel::Model
  include ActiveModel::Validations

  def self.reflect_on_all_associations(scope); []; end
  def self.reflect_on_association(name); nil; end
  def self.columns_hash
    {
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
    ServiceDefinition.all.map do |service_definition|
      service_definition_commit = ServiceDefinitionCommit.new(
        service_definition_id: service_definition.id,
        name: name,
        email: email,
        message: message)
      service_definition_commit.save
    end.all?
  end

end
