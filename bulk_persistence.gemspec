# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'bulk_persistence'
  s.version = '0.0.1'
  s.author = 'Adão Santos <djadao@gmail.com>'
  s.summary = 'This gem was created to allow bulk operations with active record models'
  s.homepage = 'https://github.com/adaosantos/bulk-persistence'
  s.license = 'MIT'

  s.required_ruby_version = '>= 2.6.6'

  s.files = Dir['{lib}/**/*.rb', 'LICENSE', '*.md']
  s.test_files = Dir['test/*.rb']

  s.add_dependency 'activerecord', '>= 4.2'
  s.add_dependency 'activesupport', '>= 4.2'

  s.add_development_dependency 'bundler', '>= 1.5', '< 3.0'
  s.add_development_dependency 'minitest', '~> 5.14'
  s.add_development_dependency 'minitest-focus', '~> 1.3.0'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rdoc'
  s.add_development_dependency 'rubocop', '~> 1.20.0'
  s.add_development_dependency 'simplecov', ['>= 0.18.1', '< 0.22.0']
end
