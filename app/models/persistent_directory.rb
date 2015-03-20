class PersistentDirectory < ActiveRecord::Base
  belongs_to :blueprint_version

  def as_json(options={})
    options[:except] ||= [:created_at, :updated_at, :id, :blueprint_version_id]
    super
  end

  def attributes_from_yaml
    YAML.load_file('app/attributes.yml')[:persistent_directory]
  end

end
