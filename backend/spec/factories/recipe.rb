FactoryBot.define do
  factory :recipe do
    title { "Test Recipe" }
    cook_time { 30 }
    prep_time { 15 }
    ratings { 4.5 }
    cuisine { "Italian" }
    category { "Dinner" }
    author { "Test Author" }
    image { "test_image.jpg" }
  end
end