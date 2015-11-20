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

  # def as_json
  #   as_json
  # end

  def as_json(options={})
    {
      shema_version: 0,
      software:
      clean_data({
        blueprint_version:
          {
            major: major,
            minor: minor,
            release_level: release_level,
            patch: patch
          },
        name: software_version.software.default_engine_name,
        license_name: software_version.software.license.to_handle,
        license_label: software_version.software.license.to_label,
        license_sourceurl: software_version.software.license.source_url,
        full_title: software_version.software.full_title,
        short_title: software_version.software.short_title,
        description: software_version.software.description,
        icon_url: software_version.software.icon_url,
        home_page_url: software_version.software.home_page_url,
        support_page_url: software_version.software.support_page_url,
        about: software_version.software.about,
        language: software_version.software.language.to_handle,
        framework: software_version.software.framework.to_handle,
        deployment_type: software_version.software.deployment_type.to_handle,
        web_root_directory: web_root_directory,
        first_run_url: first_run_url,
        publisher: software_version.software.publisher.to_handle,
        blocking_worker_name: (blocking_worker.name if blocking_worker.present?),
        required_memory: required_memory,
        recommended_memory: recommended_memory,
        http_protocol: http_protocol_handle,
        framework_port_overide: framework_port_overide,
        custom_start_script: custom_start_script,
        custom_install_script: custom_install_script,
        custom_post_install_script: custom_post_install_script,
        service_configurations: service_configurations.as_json,
        persistent_directories: persistent_directories.as_json,
        replacement_strings: replacement_strings.as_json,
        persistent_files: persistent_files.as_json,
        installed_packages: installed_packages.as_json,
        system_packages: system_packages.as_json,
        workers: workers.as_json,
        ports: ports.as_json,
        external_repositories: external_repositories.as_json,
        rake_tasks: rake_tasks.as_json,
        template_files: template_files.as_json,
        file_write_permissions: file_write_permissions.as_json,
        custom_php_inis: custom_php_inis.as_json,
        apache_htaccess_files: apache_htaccess_files.as_json,
        apache_httpd_configurations: apache_httpd_configurations.as_json,
        modules: blueprint_modules.as_json,
        variables: variables.as_json,
        component_sources: component_sources.as_json,
        component_path: software_version.software.component_path,
        extract_components: software_version.software.extract_components,
        installation_report_template: installation_report_template,
        continuous_deployment: continuous_deployment,
        database_seed_file: database_seed_file
      })
    }
  end

  def json_html
    ap as_json, plain: true, index: false
  end

  def to_handle
    software_version.to_handle + '_' + name.downcase.gsub(' ', '_')
  end

  def to_label
    software_version.to_label + ' ' + name
  end

  def humanize_html
    Humanizer::Blueprint.new(to_json).html
  end

  def version
    "#{major.to_i}.#{minor.to_i}.#{release_level.nil? ? '?' : release_level}.#{patch.to_i}"
  end

  def memory
    "#{required_memory.to_i}/#{recommended_memory.to_i} MB"
  end


  def library_software_record
    {
      label: name,
      detail: software_version.software.description,
      repository_url: 'https://github.com/EnginesBlueprints/OwnCloud.git',
      name: software_version.software.default_engine_name,
      icon_url: software_version.software.icon_url
    }
  end


private

  def http_protocol_handle
    http_protocol.downcase.gsub(' ', '_')
  end

  def clean_data(dirty_data)
    if dirty_data.is_a? Array
      dirty_data.map do |v|
        clean_data v
      end.compact
    elsif dirty_data.is_a? Hash
      {}.tap do |result|
        dirty_data.map do |k, v|
          v = clean_data v
          result[k] = clean_data v if v.present?
        end
      end
    elsif dirty_data.is_a? String
      dirty_data.strip
    else
      dirty_data
    end
  end

end
