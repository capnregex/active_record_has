# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  extend ActiveRecordHas
  primary_abstract_class
end
