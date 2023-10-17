# frozen_string_literal: true

class Track < ApplicationRecord
  has_many :sessions, dependent: :destroy

  validates :name, presence: true
end
