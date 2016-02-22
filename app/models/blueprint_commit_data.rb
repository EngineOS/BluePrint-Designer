class BlueprintCommitData

  attr_accessor :blueprint_version

  def initialize(blueprint_version)
    @blueprint_version = blueprint_version
  end

  def blueprint_version_yaml
    blueprint_version_hash.deep_stringify_keys!.to_yaml
  end

  def blueprint_version_json
    blueprint_version_hash.deep_stringify_keys!.to_json
  end

  def blueprint_version_hash

    # {
    #   blueprint_publisher: {
    #     name:
    #     organisation:
    #     contact: {
    #       email:
    #     },
    #   },
    #   software_publisher: {
    #     name:
    #     organisation:
    #     contact: {
    #       email:
    #     },
    #   },
    #   license: {
    #     name: software_version.software.license.to_handle,
    #     label: software_version.software.license.to_label,
    #     sourceurl: software_version.software.license.source_url
    #   },
    #   version: {
    #     major: major,
    #     minor: minor,
    #     release_level: release_level,
    #     patch: patch
    #   },
    #   presentation: {
    #     full_title: software_version.software.full_title,
    #     short_title: software_version.software.short_title,
    #     description: software_version.software.description,
    #     icon_url: software_version.software.icon_url,
    #     home_page_url: software_version.software.home_page_url,
    #     support_page_url: software_version.software.support_page_url,
    #     about: software_version.software.about,
    #   }
    #
    {
      software:
      {
        name: blueprint_version.software_version.software.default_engine_name,
        major: blueprint_version.major,
        minor: blueprint_version.minor,
        release_level: blueprint_version.release_level,
        patch: blueprint_version.patch,
        license_name: blueprint_version.software_version.software.license.to_handle,
        license_label: blueprint_version.software_version.software.license.to_label,
        license_sourceurl: blueprint_version.software_version.software.license.source_url,
        full_title: blueprint_version.software_version.software.full_title,
        short_title: blueprint_version.software_version.software.short_title,
        description: blueprint_version.software_version.software.description,
        icon_url: blueprint_version.software_version.software.icon_url,
        home_page_url: blueprint_version.software_version.software.home_page_url,
        support_page_url: blueprint_version.software_version.software.support_page_url,
        about: blueprint_version.software_version.software.about,
        language: blueprint_version.software_version.software.language.to_handle,
        framework: blueprint_version.software_version.software.framework.to_handle,
        deployment_type: blueprint_version.software_version.software.deployment_type.to_handle,
        web_root_directory: blueprint_version.web_root_directory,
        first_run_url: blueprint_version.first_run_url,
        publisher: blueprint_version.software_version.software.publisher.to_handle,
        blocking_worker_name: (blueprint_version.blocking_worker.name if blueprint_version.blocking_worker.present?),
        required_memory: blueprint_version.required_memory,
        recommended_memory: blueprint_version.recommended_memory,
        http_protocol: http_protocol_handle_for_blueprint_version_hash,
        framework_port_overide: blueprint_version.framework_port_overide,
        custom_start_script: blueprint_version.custom_start_script,
        custom_install_script: blueprint_version.custom_install_script,
        custom_post_install_script: blueprint_version.custom_post_install_script,
        service_configurations: service_configurations_for_blueprint_version_hash,
        persistent_directories: persistent_directories_for_blueprint_version_hash,
        replacement_strings: replacement_strings_for_blueprint_version_hash,
        persistent_files: persistent_file_for_blueprint_version_hash,
        installed_packages: installed_packages_for_blueprint_version_hash,
        system_packages: system_packages_for_blueprint_version_hash,
        workers: workers_for_blueprint_version_hash,
        ports: ports_for_blueprint_version_hash,
        external_repositories: external_repositories_for_blueprint_version_hash,
        rake_tasks: rake_tasks_for_blueprint_version_hash,
        template_files: template_files_for_blueprint_version_hash,
        file_write_permissions: file_write_permissions_for_blueprint_version_hash,
        custom_php_inis: custom_php_inis_for_blueprint_version_hash,
        apache_htaccess_files: apache_htaccess_files_for_blueprint_version_hash,
        apache_httpd_configurations: apache_httpd_configurations_for_blueprint_version_hash,
        modules: modules_for_blueprint_version_hash,
        variables: variables_for_blueprint_version_hash,
        component_sources: component_sources_for_blueprint_version_hash,
        component_path: blueprint_version.software_version.software.component_path,
        extract_components: blueprint_version.software_version.software.extract_components,
        installation_report_template: blueprint_version.installation_report_template,
        continuous_deployment: blueprint_version.continuous_deployment,
        database_seed_file: blueprint_version.database_seed_file
      }
    }
  end

  def service_configurations_for_blueprint_version_hash
    blueprint_version.service_configurations.map do |service_configuration|
      {
        publisher_namespace: service_configuration.service_definition_path.split('/').first,
        type_path: service_configuration.service_definition_path.split('/').drop(1).join('/'),
        variables: service_configuration.variables.map do |variable|
          {variable.name => variable.value}
        end.reduce(:merge)
      }
    end
  end

  def persistent_directories_for_blueprint_version_hash
    blueprint_version.persistent_directories.map{ |persistent_directory| {path: persistent_directory.path} }
  end

  def replacement_strings_for_blueprint_version_hash
    blueprint_version.replacement_strings.map do |replacement_string|
      {
        replacement_string: replacement_string.replacement_string,
        file: replacement_string.file,
        destination: replacement_string.destination
      }
    end
  end

  def persistent_file_for_blueprint_version_hash
    blueprint_version.persistent_files.map do |persistent_file|
      { path: persistent_file.path }
    end
  end

  def installed_packages_for_blueprint_version_hash
    blueprint_version.installed_packages.map do |installed_package|
      {
        name: installed_package.name,
        source_url: installed_package.source_url,
        destination: installed_package.destination,
        extraction_command: installed_package.extraction_command,
        path_to_extracted: installed_package.path_to_extracted
      }
    end
  end

  def system_packages_for_blueprint_version_hash
    blueprint_version.system_packages.map do |system_package|
      { package: system_package.package }
    end
  end


  def workers_for_blueprint_version_hash
    blueprint_version.workers.map do |worker|
      { name: worker.name, command: worker.command }
    end
  end

  def ports_for_blueprint_version_hash
    blueprint_version.ports.map do |port|
      {
        port: port.port,
        external: port.external,
        protocol: port.protocol
      }
    end
  end

  def external_repositories_for_blueprint_version_hash
    blueprint_version.external_repositories.map do |external_repository|
      { repository: external_repository.repository }
    end
  end

  def rake_tasks_for_blueprint_version_hash
    blueprint_version.rake_tasks.map do |rake_task|
      {
        action: rake_task.action,
        created_at: rake_task.created_at,
        updated_at: rake_task.updated_at,
        always_run: rake_task.always_run
      }
    end
  end

  def template_files_for_blueprint_version_hash
    blueprint_version.template_files.map do |template_file|
      {
        title: template_file.title,
        path: template_file.path,
        content: template_file.content,
      }
    end
  end

  def file_write_permissions_for_blueprint_version_hash
    blueprint_version.file_write_permissions.map do |file_write_permission|
      {
        path: file_write_permission.path,
        recursive: file_write_permission.recursive,
       }
    end
  end

  def custom_php_inis_for_blueprint_version_hash
    blueprint_version.custom_php_inis.map do |custom_php_ini|
      { content: custom_php_ini.content }
    end
  end

  def apache_htaccess_files_for_blueprint_version_hash
    blueprint_version.apache_htaccess_files.map do |apache_htaccess_file|
      {
        directory: apache_htaccess_file.directory,
        htaccess_content: apache_htaccess_file.htaccess_content
      }
    end
  end

  def apache_httpd_configurations_for_blueprint_version_hash
    blueprint_version.apache_httpd_configurations.map do |apache_httpd_configuration|
      {
        httpd_configuration: apache_httpd_configuration.httpd_configuration
      }
    end
  end

  def modules_for_blueprint_version_hash
    blueprint_version.blueprint_modules.map do |blueprint_module|
      {
        os_package: blueprint_module.os_package,
        module_name: blueprint_module.module_name,
        module_type: blueprint_module.module_type.name
      }
    end
  end

  def variables_for_blueprint_version_hash
    blueprint_version.variables.map do |variable|
      {
        name: variable.name,
        value: variable.value,
        label: variable.label,
        field_type: variable.field_type,
        select_collection: variable.select_collection,
        tooltip: variable.tooltip,
        hint: variable.hint,
        placeholder: variable.placeholder,
        comment: variable.comment,
        regex_validator: variable.regex_validator,
        regex_invalid_message: variable.regex_invalid_message,
        mandatory: variable.mandatory,
        ask_at_build_time: variable.ask_at_build_time,
        build_time_only: variable.build_time_only,
        immutable: variable.immutable
       }
    end
  end

  def component_sources_for_blueprint_version_hash
    blueprint_version.component_sources.map do |component_source|
      { url: component_source.url }
    end
  end

  def http_protocol_handle_for_blueprint_version_hash
    blueprint_version.http_protocol.downcase.gsub(' ', '_')
  end

  def blueprint_version_readme
    blueprint_version.readme
  end

end
