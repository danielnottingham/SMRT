# frozen_string_literal: true

module Talks
  class List < Actor
    input :scope, type: ActiveRecord::Relation, default: -> { Talk.all }

    output :talks, type: Enumerable

    def call
      self.talks = scope.order(created_at: :desc)
    end
  end
end
