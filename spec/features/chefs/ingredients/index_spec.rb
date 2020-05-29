require "rails_helper"

RSpec.describe "chef ingredients index page" do
  it "should display all ingredients for chef" do
    louie = Chef.create!(name: "Louis")
    dinner = Dish.create!(name: "hot dogs", description: "delicious perfect food", chef_id: louie.id)
    breakfast = Dish.create!(name: "more hot dogs", description: "delicious perfect food", chef_id: louie.id)
    hot_dog = Ingredient.create!(name: "Hebrew National hot dog", calories: 4)
    bun = Ingredient.create!(name: "bun", calories: 2)
    strawberries = Ingredient.create!(name: "strawberries", calories: 1)
    DishIngredient.create!(dish_id: dinner.id, ingredient_id: hot_dog.id)
    DishIngredient.create!(dish_id: dinner.id, ingredient_id: bun.id)
    DishIngredient.create!(dish_id: breakfast.id, ingredient_id: hot_dog.id)
    DishIngredient.create!(dish_id: breakfast.id, ingredient_id: bun.id)

    visit "/chefs/#{louie.id}/ingredients"

    expect(page).to have_content(hot_dog.name, count: 1)
    expect(page).to have_content(bun.name, count: 1)
    expect(page).to_not have_content("strawberries")
  end

end
