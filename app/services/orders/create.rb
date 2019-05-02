# frozen_string_literal: true

module Orders
  class Create < Service::Base
    parameters :product_ids, :order_params, :user_id

    attr_accessor :order

    def init
      @products = []
      @user = User.find(user_id)
    end

    def call
      build_order(@order_params)
      add_products_to_order(@order)
      @order.save!
      # success_callback(@order) if @order.save!

      # TODO: ReEnable mailers
    end

    private

      def success_callback(order)
        send_order_mail(order)
        enque_order_mail(order)
      end

      def build_order(order_params)
        @order = Order.create(order_params)
        @order.user = @user
      end

      def add_products_to_order(order)
        @product_ids.each do |id|
          product = Product.find(id)
          @products << product unless product.nil?
        end

        @order.products << @products
      end

      def send_order_mail(order)
        OrderMailer.with(order: order, user: @user)
                   .new_order(order, @user)
                   .deliver_now
      end

      def enque_order_mail(order)
        Orders::EndMail.call(
          order_id: order.id,
          user_id: @user.id
        )
      end
  end
end
