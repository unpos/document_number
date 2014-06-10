$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'document_number/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'document_number'
  s.version     = DocumentNumber::VERSION
  s.authors     = ['Evgeny Pavlov']
  s.email       = ['pavlov@7pikes.com']
  s.homepage    = 'https://github.com/7Pikes/document_number'
  s.summary     = 'Automatic document number assignment'
  s.description = 'Document Number lets you automacally assign number sequences for your rails model'
  s.license     = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*", 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '~> 4.0'

  s.add_development_dependency 'sqlite3', '~> 1.3'

  s.add_development_dependency 'rake', '~> 10.3'
  s.add_development_dependency 'minitest', '~> 5.3'
  s.add_development_dependency 'rspec-rails', '~> 3.0'
  # s.add_development_dependency 'factory_girl_rails', '~> 4.0'
  s.add_development_dependency 'database_cleaner', '~> 1.3'
  s.add_development_dependency 'shoulda', '~> 3.5'
  s.add_development_dependency 'pry', '~> 0.10'
  s.add_development_dependency 'pry-debugger', '~> 0.2'
end
