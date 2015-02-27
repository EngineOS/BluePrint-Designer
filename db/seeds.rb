User.create!([
  {username: "admin", user_type: nil, email: "admin@engines.onl", password: "EngOS2014", password_confirmation: "EngOS2014"}
])
BlueprintVersion.create!([
  {name: "v0.0.0.1", software_version_id: 1}
])
DeploymentType.create!([
  {name: "Web"},
  {name: "Worker"}
])
Framework.create!([
  {name: "Apache PHP", language_id: 1},
  {name: "Nginx", language_id: 1},
  {name: "Rails", language_id: 2},
  {name: "Sinatra", language_id: 2},
  {name: "Django", language_id: 3},
  {name: "Flask", language_id: 3},
  {name: "Pyramid", language_id: 3},
  {name: "Jetty", language_id: 4},
  {name: "Tomcat", language_id: 4}
])
Language.create!([
  {name: "PHP"},
  {name: "Ruby"},
  {name: "Python"},
  {name: "Java"},
  {name: "Node"}
])
License.create!([
  {name: "GPL v2"},
  {name: "GPL v3"},
  {name: "MIT"},
  {name: "Apache v2"}
])
Publisher.create!([
  {name: "Engines", namespace: "EnginesSystem"},
  {name: "Odoo S.A."}
])
ServiceDefinition.create!([
  {service_type_id: 4, publisher_id: 1},
  {service_type_id: 5, publisher_id: 1}
])
ServiceType.create!([
  {name: "Volume"},
  {name: "DNS"},
  {name: "Cron"},
  {name: "MySQL database", path: "database/sql/mysql"},
  {name: "Postgres database", path: "database/sql/pgsql"}
])
Software.create!([
  {full_title: "Etherpad", publisher_id: 1, language_id: 1, license_id: 2, framework_id: 1, icon_url: "http://upload.wikimedia.org/wikipedia/commons/f/ff/Logo_Etherpad.png"},
  {full_title: "Odoo", publisher_id: 2}
])
SoftwareVersion.create!([
  {version: "1.5.1", software_id: 1}
])
