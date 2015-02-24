class BlueprintVersion < ActiveRecord::Base

  attr_accessor :_destroy

  belongs_to :software_version
 
  belongs_to :blocking_worker, class_name: :Worker

  has_many :service_configurations, dependent: :destroy
  # has_many :service_configuration_variables, as: :variable_consumer, through: :service_configurations
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
  has_many :apache_modules, dependent: :destroy
  has_many :variables, as: :variable_consumer, dependent: :destroy
  has_many :component_directories, dependent: :destroy
  has_many :component_sources, dependent: :destroy
  # has_many :ports, dependent: :destroy

  # accepts_nested_attributes_for :blocking_worker, reject_if: :all_blank, allow_destroy: true
  # # accepts_nested_attributes_for :software_services, reject_if: :all_blank, allow_destroy: true
  # accepts_nested_attributes_for :service_configurations, reject_if: :all_blank, allow_destroy: true
  # accepts_nested_attributes_for :persistent_directories, reject_if: :all_blank, allow_destroy: true
  # accepts_nested_attributes_for :replacement_strings, reject_if: :all_blank, allow_destroy: true
  # accepts_nested_attributes_for :persistent_files, reject_if: :all_blank, allow_destroy: true
  # accepts_nested_attributes_for :installed_packages, reject_if: :all_blank, allow_destroy: true
  # accepts_nested_attributes_for :system_packages, reject_if: :all_blank, allow_destroy: true
  # # # accepts_nested_attributes_for :ports, reject_if: :all_blank, allow_destroy: true
  # accepts_nested_attributes_for :workers, reject_if: :all_blank, allow_destroy: true
  # accepts_nested_attributes_for :rake_tasks, reject_if: :all_blank, allow_destroy: true
  # accepts_nested_attributes_for :template_files, reject_if: :all_blank, allow_destroy: true
  # accepts_nested_attributes_for :file_write_permissions, reject_if: :all_blank, allow_destroy: true
  # accepts_nested_attributes_for :custom_php_inis, reject_if: :all_blank, allow_destroy: true
  # accepts_nested_attributes_for :apache_htaccess_files, reject_if: :all_blank, allow_destroy: true
  # accepts_nested_attributes_for :apache_modules, reject_if: :all_blank, allow_destroy: true
  # accepts_nested_attributes_for :variables, reject_if: :all_blank, allow_destroy: true
  
  validates :record_name, presence: true
  validates_uniqueness_of :record_name, :case_sensitive => false

  enum http_protocol: { :'HTTP and HTTPS' => 0, :'HTTPS only' => 1, :'HTTP only' => 2 }
  enum release_level: { :Alpha => 0, :Beta => 1, :'Release candidate' => 2, :Release => 3} 

  def as_json
      {
        record_name: record_name,
        record_comment: record_comment,
        major: major,
        minor: minor,
        release_level: release_level,
        patch: patch,
        blocking_worker_name: (blocking_worker.name if blocking_worker.present?),
        required_memory: required_memory,
        recommended_memory: recommended_memory,
        http_protocol: http_protocol,
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
        rake_tasks: rake_tasks.as_json,
        template_files: template_files.as_json,
        file_write_permissions: file_write_permissions.as_json,
        custom_php_inis: custom_php_inis.as_json,
        apache_htaccess_files: apache_htaccess_files.as_json,
        apache_modules: apache_modules.as_json,
        variables: variables.as_json,
        component_directories: component_directories.as_json,
        component_sources: component_sources.as_json
      }

  end
  
end
