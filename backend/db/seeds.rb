# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'json'

file_path = 'recipes-en.json'
file_data = File.read(file_path)
recipes = JSON.parse(file_data)

recipes.each do |recipe_data|
  recipe = Recipe.create!(
    title: recipe_data["title"],
    cook_time: recipe_data["cook_time"],
    prep_time: recipe_data["prep_time"],
    ratings: recipe_data["ratings"],
    cuisine: recipe_data["cuisine"],
    category: recipe_data["category"],
    author: recipe_data["author"],
    image: recipe_data["image"]
  )

  recipe_data["ingredients"].each do |ingredient_name|
    ingredient = Ingredient.find_or_create_by!(name: ingredient_name)
    RecipeIngredient.create!(recipe: recipe, ingredient: ingredient)
  end
end
