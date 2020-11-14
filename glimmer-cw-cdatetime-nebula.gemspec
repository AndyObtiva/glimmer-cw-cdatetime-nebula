# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: glimmer-cw-cdatetime-nebula 1.5.0.2.0 ruby lib opal

Gem::Specification.new do |s|
  s.name = "glimmer-cw-cdatetime-nebula".freeze
  s.version = "1.5.0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze, "opal".freeze]
  s.authors = ["Andy Maleh".freeze]
  s.date = "2020-11-14"
  s.description = "Nebula CDateTime Widget - Glimmer Custom Widget - A Date and Time selection widget that can be used in a simple, dropdown, spinner, or compact style.".freeze
  s.email = "andy.am@gmail.com".freeze
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    "CHANGELOG.md",
    "LICENSE.txt",
    "README.md",
    "VERSION",
    "lib/glimmer-cw-cdatetime-nebula.rb",
    "lib/glimmer-cw-cdatetime-nebula/ext/glimmer/dsl/swt/cdt_expression.rb",
    "lib/glimmer-cw-cdatetime-nebula/ext/glimmer/swt/c_date_time_proxy.rb",
    "lib/glimmer-cw-cdatetime-nebula/ext/glimmer/swt/cdt_proxy.rb",
    "lib/views/nebula/c_date_time.rb",
    "opal/glimmer-cw-cdatetime-nebula/ext/glimmer/cdt.rb",
    "opal/glimmer-cw-cdatetime-nebula/ext/glimmer/swt/c_date_time_proxy.rb",
    "opal/views/nebula/c_date_time.rb",
    "samples/nebula/c_date_time_gallery.rb",
    "vendor/nebula/org.eclipse.nebula.cwt_1.1.0.202007241204.jar",
    "vendor/nebula/org.eclipse.nebula.widgets.cdatetime_1.5.0.202007241204.jar"
  ]
  s.homepage = "http://github.com/AndyObtiva/glimmer-cw-cdatetime-nebula".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.4".freeze
  s.summary = "Nebula CDateTime Widget - Glimmer Custom Widget".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<glimmer-dsl-swt>.freeze, [">= 4.17.10.0", "< 5.0.0.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.5.0"])
    s.add_development_dependency(%q<jeweler>.freeze, ["= 2.3.9"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
  else
    s.add_dependency(%q<glimmer-dsl-swt>.freeze, [">= 4.17.10.0", "< 5.0.0.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.5.0"])
    s.add_dependency(%q<jeweler>.freeze, ["= 2.3.9"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
  end
end

