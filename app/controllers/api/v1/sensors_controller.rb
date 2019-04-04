# frozen_string_literal: true

class Api::V1::SensorsController < ApplicationController
  before_action :set_sensor, only: [:show, :destroy]
  before_action :set_user, only: [:create, :index]

  def index
    if @user.present?
      if params[:room].present?
        @sensors = @user.sensors.all.find_by(room: params[:room].downcase)
      else
        @sensors = @user.sensors.all
      end
    else
      @sensors = Sensor.all
    end

    render json: @sensors
  end

  def new
    @sensor = Sensor.new
    render json: {
      topic: @sensor.topic,
      name: @sensor.name,
      room: @sensor.room,
      var_type: @sensor.var_type
    }
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
    render json: 'Sensor deleted'
  end

  private

  def set_sensor
    @sensor = Sensor.find(params[:id])
  end

  def sensor_params
    params.require(:sensor).permit(:topic, :name, :var_type, :room)
  end
end
