class BlueprintVersion < ActiveRecord::Base

  attr_accessor :_destroy

  belongs_to :software_version

  belongs_to :blocking_worker, class_name: :Worker

  has_many :service_configurations, dependent: :destroy
  has_many :persistent_directories, dependent: :destroy
  has_many :replacement_strings, dependent: :destroy
  has_many :persistent_files, dependent: :destroy
  has_many :installed_packages, dependent: :destroy
  has_many :system_packages, dependent: :destroy
  has_many :workers, dependent: :destroy
  has_many :rake_tasks, dependent: :destroy
  has_many :template_files, dependent: :destroy
  has_many :file_write_permissions, dependent: :destroy
  has_many :custom_php_inis, dependent: :destroy
  has_many :apache_htaccess_files, dependent: :destroy
  has_many :apache_httpd_configurations, dependent: :destroy
  has_many :variables, as: :variable_consumer, dependent: :destroy
  has_many :component_sources, dependent: :destroy
  has_many :ports, dependent: :destroy
  has_many :external_repositories, dependent: :destroy
  has_many :blueprint_modules, dependent: :destroy

  # validates :record_label, presence: true
  # validates_uniqueness_of :record_label, :case_sensitive => false

  enum http_protocol: { :'HTTP and HTTPS' => 0, :'HTTPS only' => 1, :'HTTP only' => 2 }
  enum release_level: { :Alpha => 0, :Beta => 1, :'Release candidate' => 2, :Release => 3}


  def pretty_print
    blueprint_save.blueprint_version_hash.deep_stringify_keys
  end

  def to_handle
    software_version.to_handle + '_' + name.downcase.gsub(' ', '_')
  end

  def to_label
    software_version.to_label + ' ' + name
  end

  def blueprint_save
    BlueprintSave.new(self)
  end

  def save_to_repository
    blueprint_save.save
  end

  def humanize_html
    BlueprintHumanizer::Blueprint.new(to_json).html
  end

  def version
    "#{major.to_i}.#{minor.to_i}.#{patch.to_i} (#{release_level.nil? ? 'no release level' : release_level})"
  end

  def memory
    "#{required_memory.to_i}/#{recommended_memory.to_i} MB"
  end


  def library_software_record
    {
      label: software_version.software.short_title || software_version.software.default_engine_name,
      detail: software_version.software.description,
      repository_url: "http://__HOST_WITH_PORT__/api/v0/software/#{id}",
      name: software_version.software.default_engine_name,
      icon_url: software_version.software.icon_url
    }
  end

private

  # def clean_data(dirty_data)
  #   if dirty_data.is_a? Array
  #     dirty_data.map do |v|
  #       clean_data v
  #     end.compact
  #   elsif dirty_data.is_a? Hash
  #     {}.tap do |result|
  #       dirty_data.map do |k, v|
  #         v = clean_data v
  #         result[k] = clean_data v if v.present?
  #       end
  #     end
  #   elsif dirty_data.is_a? String
  #     dirty_data.strip
  #   else
  #     dirty_data
  #   end
  # end

end
