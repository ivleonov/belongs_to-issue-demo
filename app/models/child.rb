# frozen_string_literal: true

class Child < ApplicationRecord
  self.table_name = 'children'

  belongs_to :parent, class_name: 'Parent', primary_key: 'external_id'
end
