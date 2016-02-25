module Repository
  module ServiceDefinition
    class Load

      attr_accessor :service_definition_path, :repository

      def initialize(service_definition_path)
        @service_definition_path = service_definition_path
        @repository = ::Repository::Repository.new
      end

      def attributes
        {
          accepts_attributes: accepts_attributes,
          title: service_definition[:title],
          description: service_definition[:description],
          author: service_definition[:author],
          publisher_namespace: service_definition[:publisher_namespace],
          type_path: service_definition[:type_path],
          major: service_definition[:version].present? ? service_definition[:version]['major'] : 0,
          minor: service_definition[:version].present? ? service_definition[:version]['minor'] : 0,
          release_level: service_definition[:version].present? ? service_definition[:version]['release_level'] : 0,
          patch: service_definition[:version].present? ? service_definition[:version]['patch'] : 0,
          service_container: service_definition[:service_container],
          service_handle_field: service_definition[:service_handle_field],
          dedicated: service_definition[:dedicated] == true,
          persistent: service_definition[:persistent] == true,
          immutable: service_definition[:immutable] == true,
          attach_post_build: service_definition[:attach_post_build] == true,
          attach_requires_restart: service_definition[:attach_requires_restart] == true,
          readme: @readme_file,
          target_envs_attributes: target_envs_attributes,
          consumer_attributes: consumer_attributes,
          configurators_attributes: configurators_attributes,
        }
      end

      def accepts_attributes
        (service_definition[:accepts] || []).
          map do |accept|
            {accepts_type: accept}
          end
      end

      def target_envs_attributes
        if service_definition[:target_environment_variables].present?
          service_definition[:target_environment_variables].values
        end || []
       end

      def consumer_attributes
        service_definition[:consumer_params].present? ? {variables_attributes: service_definition[:consumer_params].values.map{|param| param[:select_collection] = param[:select_collection].to_s; param}} : {}
      end

      def configurators_attributes
        if service_definition[:configurators].present?
          service_definition[:configurators].values.map do |configurator|
            configurator[:variables_attributes] = configurator[:params].values.map{|param| param[:select_collection] = param[:select_collection].to_s; param}
            configurator.except(:params)
          end
        else
          []
        end
      end

      def service_definition
        @service_definition ||= repository.
          service_definition_for(service_definition_path).
          merge( readme: repository.
                   service_definition_readme_for(service_definition_path) )
      end

    end
  end
end
