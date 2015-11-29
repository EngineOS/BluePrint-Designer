class ServiceDefinitionCommit < ActiveRecord::Base

  attr_accessor :commit_message

  belongs_to :service_definition

  def commit(username)
    valid? &&
    RepoCommit.new(
      service_definition.service_type.filename + '.yaml',
      service_definition.as_json.to_yaml,
      username,
      commit_message,
      service_definition.readme,
      "service_designs/providers/#{service_definition.publisher.namespace}/#{service_definition.service_type.path}"
    ).commit
  end

  validates :commit_message, presence: true

end