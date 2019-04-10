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
    order = Order.new(order_params)

    products_ids = params[:products_ids]

    products = []
    products_ids.each do |p|
      products << Product.find(p)
    end

    render json: order
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
    @order = current_user.order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:start_date, :end_date)
  end
end
