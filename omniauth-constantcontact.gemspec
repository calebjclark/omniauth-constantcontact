# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-constantcontact/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-constantcontact"
  s.version     = OmniAuth::ConstantContact::VERSION
  s.authors     = ["Caleb Clark"]
  s.email       = ["cclark@mobilizationlabs.com"]
  s.homepage    = ""
  s.summary     = %q{OmniAuth strategy for ConstantContact}
  s.description = %q{OmniAuth strategy for ConstantContact}

  s.rubyforge_project = "omniauth-constantcontact"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'omniauth-oauth', '~> 1.0'
  s.add_runtime_dependency 'multi_xml'

  s.add_development_dependency 'rspec', '~> 2.7.0'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'rack-test'

end
