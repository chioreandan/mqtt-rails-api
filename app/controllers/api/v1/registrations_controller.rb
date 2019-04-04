# frozen_string_literal: true

class Api::V1::RegistrationsController < ApplicationController
  skip_before_action :doorkeeper_authorize!

  def new
    user = User.new
    render json: user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors.messages
    end
  end

  private

  def user_params
    params.require(:registration).permit(:email, :password, :password_confirmation)
  end
end
