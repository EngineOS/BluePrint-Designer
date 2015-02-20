# -*- encoding: utf-8 -*-
# stub: i18n-country-translations 1.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "i18n-country-translations"
  s.version = "1.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Brian McQuay"]
  s.date = "2014-10-18"
  s.description = "The purpose of this gem is to simply provide country translations. The gem is intended to be easy to combine with other gems that require i18n country translations so we can have common i18n country translation gem."
  s.email = ["brian@onomojo.com"]
  s.homepage = "https://github.com/onomojo/i18n-country-translations"
  s.licenses = ["MIT", "GPL-2"]
  s.rubygems_version = "2.3.0"
  s.summary = "I18n Country Translations"

  s.installed_by_version = "2.3.0" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<i18n>, ["~> 0.5"])
      s.add_runtime_dependency(%q<railties>, [">= 3.0"])
      s.add_development_dependency(%q<rails>, ["~> 3.0"])
      s.add_development_dependency(%q<rspec-rails>, [">= 0"])
      s.add_development_dependency(%q<i18n-spec>, [">= 0"])
      s.add_development_dependency(%q<nokogiri>, [">= 0"])
      s.add_development_dependency(%q<webmock>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<i18n>, ["~> 0.5"])
      s.add_dependency(%q<railties>, [">= 3.0"])
      s.add_dependency(%q<rails>, ["~> 3.0"])
      s.add_dependency(%q<rspec-rails>, [">= 0"])
      s.add_dependency(%q<i18n-spec>, [">= 0"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<webmock>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<i18n>, ["~> 0.5"])
    s.add_dependency(%q<railties>, [">= 3.0"])
    s.add_dependency(%q<rails>, ["~> 3.0"])
    s.add_dependency(%q<rspec-rails>, [">= 0"])
    s.add_dependency(%q<i18n-spec>, [">= 0"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<webmock>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end
