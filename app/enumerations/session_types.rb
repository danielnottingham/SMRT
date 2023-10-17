# frozen_string_literal: true

class SessionTypes < EnumerateIt::Base
  associate_values(
    :morning,
    :afternoon
  )
end
