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

  s.required_ruby_version = '>= 1.8.7'

  s.add_dependency 'activerecord', ['>= 4.0', '< 7.0']

  s.add_development_dependency 'rails'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'rspec-rails'
  # s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'shoulda'
end
