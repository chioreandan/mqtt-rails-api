# frozen_string_literal: true

class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy, :update]

  def index
    products = Product.all
    products = filter(products) if params[:q].present?
    authorize products

    render json: products
  end

  def new
    product = Product.new

    render json: product
  end

  def create
    @product = Product.create(product_params)
    authorize @product

    render json: @product
  end

  def show
    authorize @product

    render json: @product
  end

  def destroy
    authorize @product
    @product.destroy

    render json: 'Product destroyed'
  end

  def update
    authorize @product
    @product.update(product_params)

    render json: @product
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :code)
  end

  def filter(products)
    products.ransack(params[:q])
      .result
  end
end
