$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "document_number/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "document_number"
  s.version     = DocumentNumber::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of DocumentNumber."
  s.description = "TODO: Description of DocumentNumber."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", ">= 4.0.0"

  s.add_development_dependency "sqlite3"

  s.add_development_dependency 'rake', '~> 10.3.2'
  s.add_development_dependency 'minitest', '~> 5.3'
  s.add_development_dependency 'rspec-rails', '~> 3.0'
  # s.add_development_dependency 'factory_girl_rails', '~> 4.0'
  s.add_development_dependency 'database_cleaner', '~> 1.3'
  s.add_development_dependency 'shoulda', '~> 3.5'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'pry-debugger'
end
