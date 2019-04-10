# frozen_string_literal: true

module Attachers
  class PromoteJob
    include Sidekiq::Worker

    def perform(data)
      Shrine::Attacher.promote(data)
    end
  end
end
