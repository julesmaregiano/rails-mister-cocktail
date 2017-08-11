class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def show
    get_ingredient
    @dose = Dose.new
  end

  def new
    @ingredient = Ingredient.new
    @dose = Dose.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      redirect_to ingredients_path(@ingredient)
    else
      render :new
    end
  end

  private

  def get_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
