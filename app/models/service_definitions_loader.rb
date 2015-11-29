class ServiceDefinitionsLoader

  include ActiveModel::Model
  
  attr_accessor :branch #, :service_definition_file, :readme_file #, :service_version_id, :record

  validates :branch, presence: true

  def repo_branch_list
    ['alpha', 'current', 'beta-rc']
  end

  def upload_all
    ServiceDefinition.destroy_all
    ServiceDesignsRepoInspector.new.files.each do |file_pair|
      ServiceDefinitionCreateFromFiles.create_from(file_pair[:service_design], file_pair[:readme])
    end.exclude? false
  end

  def new_record?; true; end
  def self.reflect_on_all_associations(args={}); []; end
  def self.reflect_on_association(args={}); nil; end
  
end