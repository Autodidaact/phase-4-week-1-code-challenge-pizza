class RestaurantPizzasController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  def create
    restaurant_pizza = RestaurantPizza.create!(restaurant_pizza_params)
    render json: restaurant_pizza.pizza, except: [:created_at, :updated_at], status: :created
  end
  
  private
  
  def restaurant_pizza_params
    params.permit(:price, :restaurant_id, :pizza_id,)
  end
  
  def render_unprocessable_entity_response(invalid)
    render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end
  
end
