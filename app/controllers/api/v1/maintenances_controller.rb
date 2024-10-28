class MaintenancesController < ApplicationController
    before_action :set_maintenance, only: %i[show update destroy]
  
    def index
      @maintenances = Maintenance.all
      render json: @maintenances
    end
  
    def show
      render json: @maintenance
    end
  
    def create
      @maintenance = Maintenance.new(maintenance_params)
      if @maintenance.save
        render json: @maintenance, status: :created
      else
        render json: @maintenance.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @maintenance.update(maintenance_params)
        render json: @maintenance
      else
        render json: @maintenance.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @maintenance.destroy
      head :no_content
    end
  
    private
  
    def set_maintenance
      @maintenance = Maintenance.find(params[:id])
    end
  
    def maintenance_params
      params.require(:maintenance).permit(:vehicle_id, :start_date, :end_date, :description, :cost, :status)
    end
  end
  