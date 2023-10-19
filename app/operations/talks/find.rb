# frozen_string_literal: true

module Talks
  class Find < Actor
    input :id, type: String

    output :talk, type: Talk

    def call
      self.talk = Talk.find(id)
    end
  end
end
