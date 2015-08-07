# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "middleman-widont"

Gem::Specification.new do |s|
  s.name = "middleman-widont"
  s.version = Widont::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Jeremy Boles"]
  s.email = ["jeremy@centralstandard.com"]
  s.homepage = "https://git.centralstandard.com/centralstandard/middleman-widont"
  s.summary = %q{Middleman extension for removing widows from HTML elements}
  s.description = %q{Remove widows in Middleman}
  s.license = "MIT"
  s.files = `git ls-files -z`.split("\0")
  s.test_files = `git ls-files -z -- {fixtures,features}/*`.split("\0")
  s.require_paths = ["lib"]
  s.required_ruby_version = '>= 2.0'

  s.add_dependency("middleman-core", [">= 3.3"])
  s.add_dependency("nokogiri", ["~> 1.6.6.2"])
end
