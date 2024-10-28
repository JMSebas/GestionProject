class RentalsController < ApplicationController
    before_action :set_rental, only: %i[show update destroy]
  
    def index
      @rentals = Rental.all
      render json: @rentals
    end
  
    def show
      render json: @rental
    end
  
    def create
      @rental = Rental.new(rental_params)
      if @rental.save
        render json: @rental, status: :created
      else
        render json: @rental.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @rental.update(rental_params)
        render json: @rental
      else
        render json: @rental.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @rental.destroy
      head :no_content
    end
  
    private
  
    def set_rental
      @rental = Rental.find(params[:id])
    end
  
    def rental_params
      params.require(:rental).permit(:reservation_id, :user_id, :actual_start_date, :expected_return_date, :actual_return_date, :initial_odometer, :final_odometer, :status)
    end
  end
  