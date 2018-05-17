class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end


#   def new
#     @restaurant = Restaurant.find(params[:restaurant_id])
#     @review = Review.new
#   end

#   def create
#     @review = Review.new(review_params)
#     @restaurant = Restaurant.find(params[:restaurant_id])
#     @review.restaurant = @restaurant
#     @review.save
#     redirect_to restaurant_path(@restaurant)
#   end

#   def review_params
#     params.require(:review).permit(:content, :rating, :restaurant_id)
#   end
# end
