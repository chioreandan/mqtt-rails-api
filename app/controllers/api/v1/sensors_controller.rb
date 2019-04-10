# frozen_string_literal: true

class Api::V1::SensorsController < ApplicationController
  before_action :set_sensor, only: [:show, :destroy]

  def index
    if current_user.present?
      sensors = current_user.sensors
    else
      sensors = Sensor.all
    end

    render json: sensors
  end

  def new
    sensor = Sensor.new
    render json: sensor
  end

  def create
    sensor = Sensor.new(sensor_params)
    sensor.user = current_user

    if sensor.save
      render json: sensor
    else
      render json: sensor.errors.messages
    end
  end

  def show
    render json: @sensor
  end

  def destroy
    @sensor.destroy
    render json: 'Sensor deleted'
  end

  private

  def set_sensor
    @sensor = current_user.sensor.find(params[:id])
  end

  def sensor_params
    params.require(:sensor).permit(:topic, :name, :var_type, :room)
  end
end
