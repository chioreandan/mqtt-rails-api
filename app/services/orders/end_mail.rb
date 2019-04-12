# frozen_string_literal: true

module Orders
  class EndMail < Service::Base
    END_THRESHOLD = 30.minutes.freeze

    parameters :order_id, :user_id

    def init
      @order = Order.find(order_id)
      @user = User.find(user_id)
    end

    def call
      if time_until_end_order.positive?
        send_order_mail
      else
        self.class.scheduled_call(time_until_end_order.abs.seconds, order_id: @order.id, user_id: @user.id)
      end
    end

    private

      def time_until_end_order
        (Time.zone.now + END_THRESHOLD) - @order.end_date
      end

      def send_order_mail
        OrderMailer.with(order: @order, user: @user)
                   .ending(@order, @user)
                   .deliver_now
      end
  end
end
