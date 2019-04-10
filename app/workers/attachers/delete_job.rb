# frozen_string_literal: true

module Attachers
  class DeleteJob
    include Sidekiq::Worker

    def perform(data)
      Shrine::Attacher.delete(data)
    end
  end
end
