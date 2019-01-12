# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save!
      render json: @user.email
    else
      render json: @user.errors
    end
  end

  def log_in
    @user = User.find_by(email: user_params[:email])

    if @user&.password == user_params[:password]
      render json:
                  {
                    email: @user.email,
                    id: @user.id
                  }
    else
      render json: 'unauthorized'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
