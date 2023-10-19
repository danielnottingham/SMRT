# frozen_string_literal: true

FactoryBot.define do
  factory :talk do
    title { "MyString" }
    duration { 1 }
    lightning_talk { false }
    session
  end
end
