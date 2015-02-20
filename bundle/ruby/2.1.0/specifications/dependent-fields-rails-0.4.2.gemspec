# -*- encoding: utf-8 -*-
# stub: dependent-fields-rails 0.4.2 ruby lib

Gem::Specification.new do |s|
  s.name = "dependent-fields-rails"
  s.version = "0.4.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Lion Vollnhals"]
  s.date = "2014-01-20"
  s.email = "lion@giantmonkey.de"
  s.homepage = "https://github.com/vollnhals/dependent-fields-rails"
  s.rubygems_version = "2.3.0"
  s.summary = "DependentFields makes it easy to hide or show dependent fields in forms based on select or checkbox values"

  s.installed_by_version = "2.3.0" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jquery-rails>, [">= 0"])
      s.add_runtime_dependency(%q<coffee-rails>, [">= 0"])
      s.add_runtime_dependency(%q<railties>, [">= 3.1"])
    else
      s.add_dependency(%q<jquery-rails>, [">= 0"])
      s.add_dependency(%q<coffee-rails>, [">= 0"])
      s.add_dependency(%q<railties>, [">= 3.1"])
    end
  else
    s.add_dependency(%q<jquery-rails>, [">= 0"])
    s.add_dependency(%q<coffee-rails>, [">= 0"])
    s.add_dependency(%q<railties>, [">= 3.1"])
  end
end
