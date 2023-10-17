# frozen_string_literal: true

class Session < ApplicationRecord
  belongs_to :track

  validates :starts_at, presence: true
  validates :ends_at, presence: true

  validate :starts_at_must_be_before_ends_at
  validate :ends_at_must_be_after_starts_at
  validate :starts_at_and_ends_at_in_same_day

  private

  def starts_at_must_be_before_ends_at
    return unless starts_at && ends_at

    return unless starts_at >= ends_at

    errors.add(:starts_at, "must be before ends_at")
  end

  def ends_at_must_be_after_starts_at
    return unless starts_at && ends_at

    return unless ends_at <= starts_at

    errors.add(:ends_at, "must be after starts_at")
  end

  def starts_at_and_ends_at_in_same_day
    return unless starts_at && ends_at

    return if starts_at.to_date == ends_at.to_date

    errors.add(:ends_at, "must be in the same day as starts_at")
  end
end
