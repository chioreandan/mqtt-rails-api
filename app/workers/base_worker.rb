# frozen_string_literal: true

class BaseWorker
  include Sidekiq::Worker
  sidekiq_options retry: 1
end
