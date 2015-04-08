require File.expand_path('../lib/mobile_view/version', __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mobile_view"
  s.version     = MobileView::VERSION
  s.authors     = ["Yu-Cheng Chuang"]
  s.email       = ["ducksteven@gmail.com"]
  s.homepage    = "https://github.com/chitsaou/mobile_view"
  s.summary     = "Rails view template for mobile devices made easy."
  s.description = "Easily specify mobile-specific view template for mobile devices in Rails application."

  s.files       = `git ls-files`.split($\)
  s.test_files  = s.files.grep(%r{^(test|spec|features)/})

  s.add_dependency "rails", "~> 4.1.5"
  s.add_dependency "rack-mobile-detect", "~> 0.4.0"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara", "~> 1.1.0"
  s.add_development_dependency "poltergeist"

  s.require_paths = ["lib"]
end
