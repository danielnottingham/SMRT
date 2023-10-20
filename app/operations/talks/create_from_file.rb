# frozen_string_literal: true

module Talks
  class CreateFromFile < Actor
    input :file, type: ActionDispatch::Http::UploadedFile

    output :talks, type: Enumerable

    def call
      self.talks = []
      lines = file.read.lines.map(&:chomp)

      lines.each do |line|
        attributes = Talks::DataParser.call(data: line)

        result = Talks::Create.result(attributes: attributes)

        fail!(error: :invalid_record) if result.failure?

        talks << result.talk
      end
    end
  end
end
