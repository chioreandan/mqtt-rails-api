# frozen_string_literal: true

class Api::V1::SensorsController < ApplicationController
  before_action :set_sensor, only: %i[show destroy]

  def index
    @sensors = Sensor.all
    render json: @sensors
  end

  def new
    @sensor = Sensor.new
    render json: @sensor
  end

  def create
    @sensor = Sensor.new(sensor_params)
    if @sensor.save!
      render json: @sensor
    else
      render json: @sensor.errors
    end
  end

  def show
    render json: @sensor
  end

  def destroy
    @sensor.destroy
    render json: 'Location deleted'
  end

  private

  def set_sensor
    @sensor = Sensor.find(params[:id])
  end

  def location_params
    params.require(:sensor).permit(:topic, :name, :type, :room, :user_id)
  end
end
