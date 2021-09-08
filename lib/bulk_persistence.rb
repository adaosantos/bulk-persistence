# frozen_string_literal: true

module BulkPersistence
  require 'active_record'
  require 'bulk_persistence/relation'
end

# Extend ActiveRecord::Relation's
ActiveRecord::Relation.extend BulkPersistence::Relation
