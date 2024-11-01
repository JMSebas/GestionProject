class VehiclesController < ApplicationController
    before_action :set_vehicle, only: %i[show update destroy]
  
    def index
      @vehicles = Vehicle.all
      render json: @vehicles
    end
  
    def show
      render json: @vehicle
    end
  
    def create
      @vehicle = Vehicle.new(vehicle_params)
      if @vehicle.save
        render json: @vehicle, status: :created
      else
        render json: @vehicle.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @vehicle.update(vehicle_params)
        render json: @vehicle
      else
        render json: @vehicle.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @vehicle.destroy
      head :no_content
    end
  
    private
  
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end
  
    def vehicle_params
      params.require(:vehicle).permit(:brand, :model, :license_plate, :year, :type, :status, :daily_rate)
    end
  end
  