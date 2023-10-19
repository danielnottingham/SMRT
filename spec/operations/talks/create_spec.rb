# frozen_string_literal: true

require "rails_helper"

RSpec.describe Talks::Create, type: :operation do
  describe ".result" do
    context "with valid attributes" do
      it "is successful" do
        session = create(:session)
        attributes = { title: "My first talk", duration: 10, lightning_talk: false, session_id: session.id }
        result = described_class.result(attributes: attributes)

        expect(result).to be_success
      end

      it "creates a new talk" do
        result = nil
        session = create(:session)
        attributes = { title: "My first talk", duration: 10, lightning_talk: false, session_id: session.id }

        expect do
          result = described_class.result(attributes: attributes)
        end.to change(Talk, :count).by(1)

        expect(result.talk.attributes).to include(
          { "title" => "My first talk", "duration" => 10, "lightning_talk" => false, "session_id" => session.id }
        )
      end
    end

    context "with invalid attributes" do
      it "fails" do
        result = described_class.result(attributes: { title: nil })

        expect(result).to be_failure
      end

      it "returns invalid talk" do
        result = described_class.result(attributes: { title: nil })

        expect(result.talk).not_to be_valid
      end
    end
  end
end
