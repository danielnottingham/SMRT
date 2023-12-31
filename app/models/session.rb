# frozen_string_literal: true

class Session < ApplicationRecord
  has_enumeration_for :session_type, with: SessionTypes, create_helpers: true

  belongs_to :track

  has_many :talks, dependent: :destroy

  validates :starts_at, presence: true
  validates :ends_at, presence: true

  validate :starts_at_must_be_before_ends_at
  validate :ends_at_must_be_after_starts_at
  validate :starts_at_and_ends_at_in_same_day

  private

  def starts_at_must_be_before_ends_at
    return unless starts_at && ends_at

    return unless starts_at >= ends_at

    errors.add(:starts_at, :must_be_before_ends_at)
  end

  def ends_at_must_be_after_starts_at
    return unless starts_at && ends_at

    return unless ends_at <= starts_at

    errors.add(:ends_at, :must_be_after_starts_at)
  end

  def starts_at_and_ends_at_in_same_day
    return unless starts_at && ends_at

    return if starts_at.to_date == ends_at.to_date

    errors.add(:ends_at, :must_be_in_the_same_day_as_starts_at)
  end
end
