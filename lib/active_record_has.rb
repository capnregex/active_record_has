# frozen_string_literal: true

require "active_record"
require_relative "active_record_has/version"
require_relative "active_record_has/reflection_methods"
require_relative "active_record_has/through_methods"

ActiveRecord::Reflection::BelongsToReflection.include ActiveRecordHas::ReflectionMethods
ActiveRecord::Reflection::HasManyReflection.include ActiveRecordHas::ReflectionMethods
ActiveRecord::Reflection::ThroughReflection.include ActiveRecordHas::ThroughMethods

module ActiveRecordHas
  class Error < StandardError; end

  def has(association, &block)
    reflection = reflections[association.to_s]
    raise Error unless reflection

    foreign_scope = reflection.foreign_scope
    foreign_scope = block.call(foreign_scope) if block
    where(foreign_scope.arel.exists)
  end
end
