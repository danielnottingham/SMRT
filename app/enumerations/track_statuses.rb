class TrackStatuses < EnumerateIt::Base
  associate_values(
    :pending,
    :completed
  )
end
