# frozen_string_literal: true

require "rails_helper"

RSpec.describe Talk do
  describe "associations" do
    it { is_expected.to belong_to(:session) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:duration) }
    it { is_expected.to validate_presence_of(:lightning_talk) }
  end
end
