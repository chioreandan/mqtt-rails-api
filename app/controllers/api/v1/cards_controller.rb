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

  private

  def card_params
    params.require(:card).permit(:uid)
  end
end
