# frozen_string_literal: true

class TrackStatuses < EnumerateIt::Base
  associate_values(
    :pending,
    :completed
  )
end
