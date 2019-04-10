# frozen_string_literal: true

class ServiceInvocationWorker < BaseWorker
  def perform service_name, args
    args.symbolize_keys!
    service_name.constantize.call(**args)
  end
end
