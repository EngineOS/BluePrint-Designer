class BlueprintCommit < ActiveRecord::Base

  attr_accessor :commit_message

  belongs_to :blueprint_version

  def commit(username)
    valid? &&
    LocalRepoCommit.new(
      blueprint_version.software_version.software.to_handle,
      blueprint_version.to_json,
      username,
      commit_message,
      blueprint_version.readme
    ).commit
  end

  validates :commit_message, presence: true


    # line = "Readme for " + @blueprint_version.software_version.software.to_label + "\n" + @blueprint_version.software_version.software.description.to_s

  # def blueprint_version
  #   Blueprintversion.find(blueprint_version_id)
  # end

  # def self.reflect_on_all_associations(association_type)
  #   []
  # end

  # def self.reflect_on_association(association_name)
  #   nil
  # end

  # def self.columns_hash
  #   { blueprint_version_id: "", commit_message: "", read_me: "" }
  # end

  # def self.column_names
  #   columns_hash.keys
  # end

  # def new_record?
  #   true
  # end

end