# frozen_string_literal: true

module Talks
  class Create < Actor
    input :attributes, type: Hash

    output :talk, type: Talk

    def call
      self.talk = Talk.new(attributes)

      fail!(error: :invalid_record) unless talk.save
    end
  end
end
