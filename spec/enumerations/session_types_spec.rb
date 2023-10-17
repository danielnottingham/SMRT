# frozen_string_literal: true

require "rails_helper"

RSpec.describe SessionTypes, type: :enumerate_it do
  describe ".list" do
    it "returns a list of session types" do
      expect(described_class.list).to eq(%w[morning afternoon])
    end
  end
end
