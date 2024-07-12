# frozen_string_literal: true

module ActiveRecordHas
  module ThroughMethods
#ActiveRecord::Reflection::ThroughReflection(
#    @class_name="Tag",
#    @inverse_which_updates_counter_cache_defined=false,
#    @delegate_reflection=ActiveRecord::Reflection::HasManyReflection(
#      @inverse_which_updates_counter_cache_defined=false,
#      @name=:tags,
#       @options={
#         :through=>:article_tags
#       },
#      @active_record=
#         Article(id: integer, title: string, category_id: integer, body: text, created_at: datetime, updated_at: datetime),
#      @klass=nil,
#      @plural_name="tags",
#      @join_table=nil,
#      @foreign_key=nil,
#      @association_foreign_key=nil,
#      @association_primary_key=nil
#    ),
#    @klass=Tag(id: integer, name: string, created_at: datetime, updated_at: datetime),
#    @source_reflection_name=:tag
#)
    def through_reflection
      @through_reflection ||= active_record.reflections[options[:through]&.to_s]
    end

    def arel_join_condition
      raise Error unless through_reflection

      through_reflection.arel_join_condition
    end

    def foreign_scope
      through = options[:through]
      raise Error unless through

      klass.joins(through).where(arel_join_condition).select(1).except(:order)
    end
  end
end
