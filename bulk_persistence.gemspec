# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'bulk_persistence'
  s.version = '0.0.1'
  s.date = '2021-09-06'
  s.summary = 'This gem was created to allow bulk operations with active record models'
  s.files = [
    'lib/bulk_persistence.rb'
  ]
  s.require_paths = ['lib']
  s.required_ruby_version = '>= 2.6.6'
  s.add_dependency 'activerecord', '>= 4.2'
end
