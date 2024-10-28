class DamagesController < ApplicationController
    before_action :set_damage, only: %i[show update destroy]
  
    def index
      @damages = Damage.all
      render json: @damages
    end
  
    def show
      render json: @damage
    end
  
    def create
      @damage = Damage.new(damage_params)
      if @damage.save
        render json: @damage, status: :created
      else
        render json: @damage.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @damage.update(damage_params)
        render json: @damage
      else
        render json: @damage.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @damage.destroy
      head :no_content
    end
  
    private
  
    def set_damage
      @damage = Damage.find(params[:id])
    end
  
    def damage_params
      params.require(:damage).permit(:rental_id, :description, :repair_cost, :status, :report_date)
    end
  end
  