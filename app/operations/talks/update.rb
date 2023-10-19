# frozen_string_literal: true

module Talks
  class Update < Actor
    input :id, type: String
    input :attributes, type: Hash

    output :talk, type: Talk

    def call
      self.talk = find_talk

      fail!(error: :invalid_record) unless talk.update(attributes)
    end

    def find_talk
      Talks::Find.result(id: id).talk
    end
  end
end
