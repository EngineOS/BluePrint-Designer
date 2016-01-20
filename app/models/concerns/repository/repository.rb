module Repository
  class Repository

    require 'rugged'
    require 'fileutils'

    def initialize
      @local_repository_path = ENV["GITDIR"] || development_repository
      @service_definitions_source_url = ENV["SERVICE_DEFINITON_REPOSITORY_URL"] || 'https://github.com/EnginesOS/ServiceDefinitions.git'
    end

    def list_service_definition_paths
      service_definitions_file_list.map { |filepath| filepath.sub(service_definitions_directory + '/providers/', '').split('/')[0..-2].join('/') }.sort
    end

    def all_service_definition_attributes
      list_service_definition_paths.map do |service_definition_path|
        ::Repository::ServiceDefinition::Load.new(service_definition_path).attributes
      end
    end

    def reset_service_definitions
      clear_local_service_definitions && clone_service_definitions
    end

    def service_definition_for(service_definition_path)
      filepath = filepath_for(service_definition_path)
      yaml = YAML::load File.read(filepath).gsub('!ruby/object:SoftwareServiceDefinition', '') if File.exist? filepath
      yaml.deep_symbolize_keys if yaml.is_a? Hash
    end

    def service_definition_readme_for(service_definition_path)
      filepath = readme_filepath_for(service_definition_path)
      File.read filepath if File.exist? filepath
    end

    def save_service_definition(service_definition_path, service_definition_yaml, readme = nil)
      # repo = Rugged::Repository.new(@local_repository_path)
      path = @local_repository_path + '/service_definitions/providers/' + service_definition_path
      filename = service_definition_path.split('/').last + '.yaml'
      filepath = path + '/' + filename
      readme_filepath = path + '/readme.md'
      FileUtils.mkdir_p(path)
      File.write( filepath, service_definition_yaml)
      File.write( readme_filepath, readme) if readme.present?
      true
    rescue => e
      false
    end

    def save_blueprint_version(blueprint_path, blueprint_yaml, readme = nil)
      # repo = Rugged::Repository.new(@local_repository_path)
      path = @local_repository_path + '/blueprints/' + blueprint_path
      filename = blueprint_path.split('/').last + '.yaml'
      filepath = path + '/' + filename
      readme_filepath = path + '/readme.md'
      FileUtils.mkdir_p(path)
      File.write( filepath, blueprint_yaml)
      File.write( readme_filepath, readme) if readme.present?
      true
    rescue => e
      false
    end

    private

    def filepath_for(service_definition_path)
      service_definitions_directory + '/providers/' + service_definition_path + '/' + service_definition_path.split('/').last + '.yaml'
    end

    def readme_filepath_for(service_definition_path)
      service_definitions_directory + '/providers/' + service_definition_path + '/readme.*'
    end

    def clear_local_service_definitions
      FileUtils.rm_rf(@local_repository_path)
    end

    def clone_service_definitions
      Rugged::Repository.clone_at @service_definitions_source_url, service_definitions_directory
    end

    # def local_repository
    #   Rugged::Repository.new @local_repository_path
    # end

    def development_repository
      "/tmp/engines/git".tap { |path| ensure_directory_exists path }
    end

    def ensure_directory_exists(path)
      FileUtils.mkdir_p path unless File.directory? path
    end

    def service_definitions_directory
      @service_definitions_directory ||= @local_repository_path + '/service_definitions'
    end

    def service_definitions_file_list
      @service_definitions_file_list ||=
        Dir.glob(service_definitions_directory + '/**/*.yaml')
    end

  end
end
