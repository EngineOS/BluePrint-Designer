module Repository
  module ServiceDefinition
    class Load

      attr_accessor :service_definition_path, :repository

      def initialize(service_definition_path)
        @service_definition_path = service_definition_path
        @repository = ::Repository::Repository.new
      end

      def attributes
  a =      {
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
          readme: service_definition[:readme],
          target_envs_attributes: target_envs_attributes,
          consumer_attributes: consumer_attributes,
          configurators_attributes: configurators_attributes,
          service_actionators_attributes: actionators_attributes,
          constants_attributes: constants_attributes
        }

p :sd________________________________________
p a
a

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
            if configurator[:params].present?
              configurator[:variables_attributes] = configurator[:params].values.map{|param| param[:select_collection] = param[:select_collection].to_s; param}
            else
              configurator[:variables_attributes] = []
            end
            configurator.except(:params)
          end
        end || []
      end

      def actionators_attributes
        if service_definition[:actionators].present?
          service_definition[:actionators].values.map do |actionator|
            if actionator[:params].present?
              actionator[:variables_attributes] = actionator[:params].values.map{|param| param[:select_collection] = param[:select_collection].to_s; param}
            else
              actionator[:variables_attributes] = []
            end
            actionator.except(:params)
          end
        end || []
      end

      def constants_attributes
        if service_definition[:constants].present?
          service_definition[:constants].values
        end || []
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
