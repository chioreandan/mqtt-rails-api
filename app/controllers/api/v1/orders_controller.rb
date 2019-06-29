# frozen_string_literal: true

class Api::V1::OrdersController < ApplicationController
  before_action :set_order, only: [:show, :destroy, :update, :return_order]

  def index
    if current_user.admin?
      orders = Order.all
    else
      orders = current_user.orders
    end
    authorize orders

    render json: orders
  end

  def returned
    orders = current_user.orders.where(returned: true)

    render json: orders
  end

  def not_returned
    orders = current_user.orders.where(returned: false)

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
    authorize service.order


    render json: service.order
  end

  def show
    authorize @order
    render json: @order
  end

  def destroy
    authorize @order
    @order.destroy

    render json: 'Product destroyed'
  end

  def update
    authorize @order
    @order.update(order_params)

    render json: @order
  end

  def return_order
    @order.update(returned: true)

    render json: @order
  end

  private

  def set_order
    @order = current_user.orders.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:start_date, :end_date)
  end
end
