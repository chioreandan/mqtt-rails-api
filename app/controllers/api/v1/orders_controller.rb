# frozen_string_literal: true

class Api::V1::OrdersController < ApplicationController
  before_action :set_order, only: [:show, :destroy]

  def index
    orders = Order.all

    render json: orders
  end

  def new
    order = Product.new

    render json: order
  end

  def create
    service = Orders::Create.call(
      product_ids: params[:product_ids],
      order_params: order_params,
      user_id: current_user&.id
    )

    render json: service.order
  end

  def show
    render json: @order
  end

  def destroy
    @order.destroy

    render json: 'Product destroyed'
  end

  private

  def set_order
    @order = current_user.orders.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:start_date, :end_date)
  end
end
