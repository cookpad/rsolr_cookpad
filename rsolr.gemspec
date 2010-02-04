# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rsolr}
  s.version = "0.12.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matt Mitchell"]
  s.date = %q{2010-02-04}
  s.description = %q{RSolr aims to provide a simple and extensible library for working with Solr}
  s.email = %q{goodieboy@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    "LICENSE",
     "README.rdoc",
     "VERSION",
     "lib/rsolr.rb",
     "lib/rsolr/client.rb",
     "lib/rsolr/connection.rb",
     "lib/rsolr/connection/net_http.rb",
     "lib/rsolr/connection/requestable.rb",
     "lib/rsolr/connection/utils.rb",
     "lib/rsolr/message.rb",
     "lib/rsolr/message/document.rb",
     "lib/rsolr/message/field.rb",
     "lib/rsolr/message/generator.rb"
  ]
  s.homepage = %q{http://github.com/mwmitchell/rsolr}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A Ruby client for Apache Solr}
  s.test_files = [
    "spec/api/client_spec.rb",
     "spec/api/connection/net_http_spec.rb",
     "spec/api/connection/requestable_spec.rb",
     "spec/api/connection/utils_spec.rb",
     "spec/api/message_spec.rb",
     "spec/api/rsolr_spec.rb",
     "spec/spec_helper.rb",
     "Rakefile",
     "tasks/spec.rake",
     "tasks/rdoc.rake"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<builder>, [">= 2.1.2"])
    else
      s.add_dependency(%q<builder>, [">= 2.1.2"])
    end
  else
    s.add_dependency(%q<builder>, [">= 2.1.2"])
  end
end

