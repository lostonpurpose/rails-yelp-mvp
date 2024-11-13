class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      # make a seperate request to go to the show page
      redirect_to restaurant_path(@restaurant)
    else
      # show the new.html.erb (but with the @restaurant we just tried to create)
      render 'new', status: :unprocessable_entity # 422
    end
  end

  

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other # redirect
  end


  private

  # strong params
  def restaurant_params
    # whitelists the attributes a user can give in the form (for security)
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
