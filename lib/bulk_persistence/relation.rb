# frozen_string_literal: true

module BulkPersistence
  module Relation
    def self.included(base)
      base.class_eval do
        def bulk_destroy_all(condition = nil, skip_validate: false)
          ActiveRecord::Base.transaction do
            models = where(condition).filter do |model|
              !skip_validate || !model.readonly?
            end

            models = run_before_destroy(models)
            counter = if paranoid?
                        where(primary_key => models.map(&:id)).update_all!(paranoid_deletion_attributes)
                      else
                        delete_all!(primary_key => models.map(&:id))
                      end
            # restore model case after destroy failed
            run_after_destroy(models).each(&:restore!)
            counter
          end
        end
      end
    end

    private

    def run_before_destroy(models)
      models.filter { |m| m.run_callbacks(:destroy) { false } }
    end

    def run_after_destroy(models)
      models.filter { |m| m.run_callbacks(:destroy).falsey? }
    end
  end
end
