class BlueprintCommit < ActiveRecord::Base

  attr_accessor :commit_message

  belongs_to :blueprint_version

  def commit(username)
    valid? &&
    RepoCommit.new(
      "blueprint.json",
      blueprint_version.to_json,
      username,
      commit_message,
      blueprint_version.readme,
      "blueprints/#{blueprint_version.software_version.software.to_handle}"
    ).commit
  end

  validates :commit_message, presence: true

end