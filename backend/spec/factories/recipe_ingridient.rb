# spec/factories/recipe_ingredient.rb

FactoryBot.define do
  factory :recipe_ingredient do
    association :recipe
    association :ingredient
  end
end