# frozen_string_literal: true

class Track < ApplicationRecord
  validates :name, presence: true
end
