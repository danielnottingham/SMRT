# frozen_string_literal: true

module Talks
  class Upload < Actor
    input :file, type: ActionDispatch::Http::UploadedFile

    output :talks, type: Enumerable

    def call
      attacher = FileUploader::Attacher.new
      attacher.assign(file)

      attacher.finalize
      file = attacher.file

      self.talks = Talks::CreateFromFile.result(file: file).talks
    end
  end
end
