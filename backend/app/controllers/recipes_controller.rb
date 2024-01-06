class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render json: @recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    render json: @recipe.as_json(include: :ingredients)
  end

  def search
    if params[:ingredients]
      ingredient_names = params[:ingredients].split(',').map(&:strip)

      # Initial subquery for each ingredient
      subqueries = ingredient_names.map do |ingredient_name|
        Recipe.joins(:ingredients).where('ingredients.name ILIKE ?', "%#{ingredient_name}%").select(:id)
      end

      # Combine subqueries to find recipes present in all of them
      combined_query = subqueries.reduce do |combined, subquery|
        combined.where(id: subquery)
      end

      # Fetch the recipes and their ingredients
      @recipes = Recipe.where(id: combined_query).includes(:ingredients)

      render json: @recipes.as_json(include: :ingredients)
    else
      render json: { error: 'No ingredients provided' }, status: :bad_request
    end
  end

end
