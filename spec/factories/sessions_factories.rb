# frozen_string_literal: true

FactoryBot.define do
  factory :session do
    track
    starts_at { 1.hour.from_now }
    ends_at { 2.hours.from_now }
  end
end
