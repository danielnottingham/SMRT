# frozen_string_literal: true

class Track < ApplicationRecord
  has_enumeration_for :status, with: TrackStatuses, create_helpers: true

  has_many :sessions, dependent: :destroy

  validates :name, presence: true
end
