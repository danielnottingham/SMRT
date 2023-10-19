# frozen_string_literal: true

require "rails_helper"

RSpec.describe Talks::List, type: :operation do
  describe ".result" do
    it "returns talks ordered by creation date DESC" do
      ruby_talk = create(:talk, title: "Ruby talk", created_at: Time.zone.yesterday)
      postgres_talk = create(:talk, title: "Postgres talk", created_at: Time.zone.tomorrow)
      rails_talk = create(:talk, title: "Rails talk", created_at: Time.zone.today)

      result = described_class.result

      expect(result.talks.to_a).to eq [postgres_talk, rails_talk, ruby_talk]
    end
  end
end
