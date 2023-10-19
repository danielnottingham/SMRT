# frozen_string_literal: true

module Talks
  class DataParser < ApplicationService
    attr_reader :data

    def initialize(data:)
      @data = data
    end

    def call
      match = data.match(/(\d+)min/)

      if match
        duration = match[1].to_i

        title = data.sub(match[0], "").strip

        { title: title, duration: duration, lightning_talk: false }
      else
        { title: data, duration: 5, lightning_talk: true }
      end
    end
  end
end
