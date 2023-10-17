# frozen_string_literal: true

require "rails_helper"

RSpec.describe Session do
  describe "associations" do
    it { is_expected.to belong_to(:track) }
    it { is_expected.to have_many(:talks).dependent(:destroy) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:starts_at) }
    it { is_expected.to validate_presence_of(:ends_at) }

    context "when starts_at is after ends_at" do
      it "is invalid" do
        session = build(:session, starts_at: 2.hours.from_now, ends_at: 1.hour.from_now)

        expect(session).not_to be_valid
      end
    end

    context "when starts_at is before ends_at" do
      it "is valid" do
        session = build(:session, starts_at: 1.hour.from_now, ends_at: 2.hours.from_now)

        expect(session).to be_valid
      end
    end

    context "when starts_at and ends_at are in the same day" do
      it "is valid" do
        session = build(:session, starts_at: 1.hour.from_now, ends_at: 3.hours.from_now)

        expect(session).to be_valid
      end
    end

    context "when starts_at and ends_at are not in the same day" do
      it "is invalid" do
        session = build(:session, starts_at: 1.day.from_now, ends_at: 2.days.from_now)

        expect(session).not_to be_valid
      end
    end
  end

  describe "enumerations" do
    it "has enumerations for session_type" do
      expect(described_class.enumerations).to include(session_type: SessionTypes)
    end
  end
end
