class ServiceConfiguration < ActiveRecord::Base

  belongs_to :blueprint_version
  belongs_to :service_blueprint

  has_many :variables, as: :variable_consumer, dependent: :destroy

  before_save :reload_service_definition

  def as_json(options={})
    {
      publisher: service_blueprint.publisher.namespace,
      type_path: service_blueprint.service_type.path,
      variables: variables.as_json
    }
  end 

  def service_definition_from_file
    # @service_definition_from_file ||= SoftwareServiceDefinition.find service_blueprint.service_type.path, service_blueprint.publisher.namespace
@service_definition_from_file ||= {:accepts=>["ManagedEngine", "ManagedService"], :author=>"Engines", :title=>"MySQL Database", :description=>"MYSQL Database ", :service_provider=>"EnginesSystem", :service_type=>"database/sql/mysql", :service_container=>"mysql_server", :dedicated=>false, :persistant=>true, :exclusive=>true, :image_name=>"engines/volmanager", :consumer_params=>nil, :setup_params=>{:database_host=>{:name=>"database_host", :label=>"database_host", :regex_validator=>".*", :tooltip=>"Local or the ip address/hostname of the database server", :field_type=>"text_field", :hint=>" ", :placeholder=>" ", :mandatory=>true, :value=>"mysql.engines.internal", :comment=>" ", :regex_invalid_message=>"wrong go back and try again"}, :name=>{:name=>"database_name", :label=>"Database name", :regex_validator=>".*", :tooltip=>" ", :field_type=>"text_field", :hint=>" ", :placeholder=>" ", :mandatory=>true, :value=>"parent_engine", :comment=>" ", :regex_invalid_message=>"wrong go back and try again"}, :username=>{:name=>"db_username", :label=>"DB User Name", :regex_validator=>".*", :tooltip=>" ", :field_type=>"text_field", :hint=>" ", :placeholder=>" ", :mandatory=>true, :value=>" ", :comment=>" ", :regex_invalid_message=>"wrong go back and try again"}, :password=>{:name=>"db_password", :label=>"DB Password", :tooltip=>" ", :field_type=>"password_with_confirmation", :hint=>" ", :placeholder=>" ", :mandatory=>true, :value=>" ", :comment=>" ", :regex_validator=>".*", :regex_invalid_message=>"wrong go back and try again"},
 # :new_field3=>{:name=>"some_new_field3", :label=>"Some new field3", :tooltip=>"'a'", :field_type=>"text_field", :hint=>"you really should make it 'a'", :placeholder=>"make it 'a'", :mandatory=>true, :value=>"b", :comment=>"some comment", :regex_validator=>"a", :regex_invalid_message=>"oops needs to be 'a'"}
 }, :target_environment_variables=>{:dbhost=>{:variable_name=>"dest", :environment_name=>"dbhost"}, :dbname=>{:variable_name=>"name", :environment_name=>"dbname"}, :dbuser=>{:variable_name=>"name", :environment_name=>"dbuser"}, :dbpasswd=>{:variable_name=>"name", :environment_name=>"dbpasswd"}, :flavor=>{:variable_name=>"dbfavor", :environment_name=>"dbflavor"}}} 

  end

  def reload_service_definition
    # if service_definition != service_definition_from_file.to_s
      self.service_definition = service_definition_from_file.to_s
      reload_service_definition_variables
    # end
  end

  def reload_service_definition_variables
    service_definition_variables = service_definition_from_file[:setup_params].values

    service_definition_variable_names = service_definition_variables.map{|variable| variable[:name]}
    service_configuration_variable_names = variables.map(&:name)

    new_variables = service_definition_variable_names - service_configuration_variable_names
    deprecated_variables = service_configuration_variable_names - service_definition_variable_names

    new_variable_definitions = service_definition_variables.select { |variable| new_variables.include? variable[:name] }

    variables.build new_variable_definitions

    deprecated_variables.each do |deprecated_variable|
      variables.find_by(name: deprecated_variable).update_attribute(:deprecated, true)
    end

  end

end
