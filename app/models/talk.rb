# frozen_string_literal: true

class Talk < ApplicationRecord
  belongs_to :session

  validates :title, presence: true
  validates :duration, presence: true
end
