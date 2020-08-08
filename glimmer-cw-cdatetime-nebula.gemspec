# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: glimmer-cw-cdatetime-nebula 1.4.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "glimmer-cw-cdatetime-nebula".freeze
  s.version = "1.4.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Andy Maleh".freeze]
  s.date = "2020-07-19"
  s.description = "Nebula CDateTime Widget - Glimmer Custom Widget - A Date and Time selection widget that can be used in a textual, graphical, or combo mode.".freeze
  s.email = "andy.am@gmail.com".freeze
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    "LICENSE.txt",
    "README.md",
    "VERSION",
    "lib/glimmer-cw-cdatetime-nebula.rb",
    "lib/views/nebula/c_date_time.rb",
    "vendor/nebula/org.eclipse.nebula.cwt_1.1.0.jar",
    "vendor/nebula/org.eclipse.nebula.widgets.cdatetime_1.4.0.jar"
  ]
  s.homepage = "http://github.com/AndyObtiva/glimmer-cw-cdatetime-nebula".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.6".freeze
  s.summary = "Nebula CDateTime Widget - Glimmer Custom Widget".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<glimmer-dsl-swt>.freeze, [">= 0.3.1", "< 2.0.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.5.0"])
      s.add_development_dependency(%q<jeweler>.freeze, ["= 2.3.9"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<glimmer-cs-gladiator>.freeze, [">= 0"])
    else
      s.add_dependency(%q<glimmer-dsl-swt>.freeze, [">= 0.3.1", "< 2.0.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.5.0"])
      s.add_dependency(%q<jeweler>.freeze, ["= 2.3.9"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<glimmer-cs-gladiator>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<glimmer-dsl-swt>.freeze, [">= 0.3.1", "< 2.0.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.5.0"])
    s.add_dependency(%q<jeweler>.freeze, ["= 2.3.9"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<glimmer-cs-gladiator>.freeze, [">= 0"])
  end
end
