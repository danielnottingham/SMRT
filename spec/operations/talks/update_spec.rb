# frozen_string_literal: true

require "rails_helper"

RSpec.describe Talks::Update, type: :operation do
  describe ".result" do
    context "with valid attributes" do
      it "is successful" do
        talk = create(:talk, title: "Old title")
        result = described_class.result(id: talk.id, attributes: { title: "New title" })

        expect(result).to be_success
      end

      it "updates talk" do
        talk = create(:talk, title: "Old title")
        described_class.result(id: talk.id, attributes: { title: "New title" })

        expect(talk.reload.attributes).to include(
          "title" => "New title"
        )
      end
    end
  end
end
