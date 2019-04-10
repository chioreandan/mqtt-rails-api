# frozen_string_literal: true

module Orders
  class Create < Service::Base
    parameters :product_ids, :order_params, :user_id

    attr_accessor :order

    def init
      @products = []
      @order = Order.create(order_params)
      @order.user_id = @user_id
    end

    def call
      @product_ids.each do |id|
        product = Product.find(id)
        @products << product unless product.nil?
      end

      @order.products << @products
      @order.save!
    end
  end
end
