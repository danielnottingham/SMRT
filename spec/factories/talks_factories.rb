# frozen_string_literal: true

FactoryBot.define do
  factory :talk do
    session
    title { "MyString" }
    duration { 1 }
    lightning_talk { false }
  end
end
