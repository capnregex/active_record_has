# frozen_string_literal: true

module ActiveRecordHas
  module ReflectionMethods
    def arel_join_condition
      klass.arel_table[join_primary_key].eq(
        active_record.arel_table[join_foreign_key]
      )
    end

    def foreign_scope
      klass.where(arel_join_condition).select(1).except(:order)
    end
  end
end
