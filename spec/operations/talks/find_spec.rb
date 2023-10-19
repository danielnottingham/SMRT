# frozen_string_literal: true

require "rails_helper"

RSpec.describe Talks::Find, type: :operation do
  describe ".result" do
    context "when talk with given id exists" do
      it "is successful" do
        talk = create(:talk)
        result = described_class.result(id: talk.id)

        expect(result).to be_success
      end

      it "returns found talk" do
        talk = create(:talk)
        result = described_class.result(id: talk.id)

        expect(result.talk).to eq talk
      end
    end

    context "when talk with given id doesn't exist" do
      it "raises ActiveRecord::RecordNotFound error" do
        expect { described_class.result(id: "invalid-id") }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
