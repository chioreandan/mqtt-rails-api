# frozen_string_literal: true

class Api::V1::CardsController < ApplicationController
  skip_before_action :doorkeeper_authorize!

  def create
    card = Card.new(card_params)
    card.user_id = params[:user_id]

    if card.save!
      render json: card
    else
      render json: card.errors.messages
    end
  end

  def log_in
    card = Card.find_by(uid: params[:uid])

    access_token = Doorkeeper::AccessToken.create!(
      resource_owner_id: card.user.id,
      expires_in: Doorkeeper.configuration.access_token_expires_in,
      use_refresh_token: Doorkeeper.configuration.refresh_token_enabled?
    )

    token_response = Doorkeeper::OAuth::TokenResponse.new(access_token)

    render json: token_response.body
  end

  private

  def card_params
    params.require(:card).permit(:uid)
  end
end
