# frozen_string_literal: true

class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]

  def index
    products = Product.all

    render json: products
  end

  def new
    product = Product.new

    render json: product
  end

  def create
    product = Product.create(product_params)

    render json: product
  end

  def show
    render json: @product
  end

  def destroy
    @product.destroy

    render json: 'Product destroyed'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :code)
  end
end
