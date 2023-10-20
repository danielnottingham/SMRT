# frozen_string_literal: true

module Talks
  class Create < Actor
    input :attributes, type: Hash

    output :talk, type: Talk

    def call
      self.talk = Talk.new(attributes.reverse_merge(session: track.sessions.first))

      fail!(error: :invalid_record) unless talk.save
    end

    private

    def track
      track = Track.find_or_create_by(name: "Track A", status: :pending)
      session = Session.new(starts_at: 1.hour.from_now, ends_at: 3.hours.from_now, session_type: :morning)
      track.sessions << session
      track.save
      track
    end
  end
end
