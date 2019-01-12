# frozen_string_literal: true

class Api::V1::SensorsController < ApplicationController
  before_action :set_sensor, only: [:show, :destroy]
  before_action :set_user, only: [:create, :index]

  def index
    if @user.present?
      @sensors = @user.sensors.all.find_by(topic: params[:topic])
    else
      @sensors = Sensor.all
    end

    render json: @sensors
  end

  def new
    @sensor = Sensor.new
    render json: @sensor
  end

  def create
    @sensor = Sensor.new(sensor_params)
    @sensor.user_id = @user.id

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

  def set_user
    @user = User.find_by(email: params[:user_email])
  end

  def set_sensor
    @sensor = Sensor.find(params[:id])
  end

  def location_params
    params.require(:sensor).permit(:topic, :name, :type, :room)
  end
end
