# spec/controllers/recipes_controller_spec.rb

require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end

  describe "GET #show" do
    let!(:recipe) { create(:recipe) }

    it "returns a success response" do
      get :show, params: { id: recipe.id }
      expect(response).to be_successful
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end
  end

  describe "GET #search" do
    let!(:ingredient) { create(:ingredient, name: 'Milk') }
    let!(:recipe) { create(:recipe) }
    let!(:recipe_ingredient) { create(:recipe_ingredient, recipe: recipe, ingredient: ingredient) }

    it "returns recipes that contain the given ingredients" do
      get :search, params: { ingredients: 'Milk' }
      expect(response).to be_successful
      expect(response.content_type).to eq("application/json; charset=utf-8")
      json_response = JSON.parse(response.body)
      expect(json_response.length).to be > 0
    end
  end
end
