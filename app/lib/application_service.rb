# frozen_string_literal: true

class ApplicationService
  def self.call(...)
    new(...).call
  end

  def call
    raise "`call` method should be implemented in concrete class"
  end
end
