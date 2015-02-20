# -*- encoding: utf-8 -*-
# stub: i18n_country_select 1.1.4 ruby lib

Gem::Specification.new do |s|
  s.name = "i18n_country_select"
  s.version = "1.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.5") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Brian McQuay (brian@onomojo.com)"]
  s.date = "2014-07-26"
  s.description = "A simple country code select helper that works with I18n translations. Works exactly the same as country_select but uses country codes instead."
  s.email = "brian@onomojo.com"
  s.homepage = "https://github.com/onomojo/i18n_country_select"
  s.licenses = ["MIT", "GPL-2"]
  s.rubyforge_project = "[none]"
  s.rubygems_version = "2.3.0"
  s.summary = "I18n country select helper"

  s.installed_by_version = "2.3.0" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<i18n>, ["~> 0.5"])
      s.add_runtime_dependency(%q<i18n-country-translations>, [">= 1.0.3", "~> 1.0"])
      s.add_runtime_dependency(%q<unicode_utils>, [">= 1.0.0", "~> 1.0"])
      s.add_development_dependency(%q<rails>, [">= 3.0.0", "~> 3.0"])
      s.add_development_dependency(%q<rspec-rails>, [">= 2.7.0", "~> 2.7"])
      s.add_development_dependency(%q<spork>, ["~> 1.0rc"])
    else
      s.add_dependency(%q<i18n>, ["~> 0.5"])
      s.add_dependency(%q<i18n-country-translations>, [">= 1.0.3", "~> 1.0"])
      s.add_dependency(%q<unicode_utils>, [">= 1.0.0", "~> 1.0"])
      s.add_dependency(%q<rails>, [">= 3.0.0", "~> 3.0"])
      s.add_dependency(%q<rspec-rails>, [">= 2.7.0", "~> 2.7"])
      s.add_dependency(%q<spork>, ["~> 1.0rc"])
    end
  else
    s.add_dependency(%q<i18n>, ["~> 0.5"])
    s.add_dependency(%q<i18n-country-translations>, [">= 1.0.3", "~> 1.0"])
    s.add_dependency(%q<unicode_utils>, [">= 1.0.0", "~> 1.0"])
    s.add_dependency(%q<rails>, [">= 3.0.0", "~> 3.0"])
    s.add_dependency(%q<rspec-rails>, [">= 2.7.0", "~> 2.7"])
    s.add_dependency(%q<spork>, ["~> 1.0rc"])
  end
end
