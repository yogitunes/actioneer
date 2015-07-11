$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "actioneer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "actioneer"
  s.version     = Actioneer::VERSION
  s.authors     = ["Daniel Staudigel"]
  s.email       = ["daniel@yogitunes.com"]
  s.homepage    = "http://github.com/yogitunes/actioneer"
  s.summary     = "Actioneer is a structure for dealing with action requests and actions."
  s.description = "Actioneer is a structure for dealing with action requests and actions."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.0"

  s.add_development_dependency "sqlite3"
end
