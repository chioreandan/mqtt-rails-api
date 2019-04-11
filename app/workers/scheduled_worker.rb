# frozen_string_literal: true

class ScheduledWorker < BaseWorker
  extend MiniScheduler::Schedule
end
