require "rails_helper"

RSpec.describe "chefs show page" do

  it "should have chef's name" do
    louie = Chef.create!(name: "Louis")
    dinner = Dish.create!(name: "hot dogs", description: "delicious perfect food", chef_id: louie.id)
    hot_dog = Ingredient.create!(name: "Hebrew National hot dog", calories: 4)
    bun = Ingredient.create!(name: "bun", calories: 2)
    DishIngredient.create!(dish_id: dinner.id, ingredient_id: hot_dog.id)
    DishIngredient.create!(dish_id: dinner.id, ingredient_id: bun.id)

    visit "/chefs/#{louie.id}"

    expect(page).to have_content("Louis")
  end

  it "should have link to chef's ingredients index" do
    louie = Chef.create!(name: "Louis")
    dinner = Dish.create!(name: "hot dogs", description: "delicious perfect food", chef_id: louie.id)
    hot_dog = Ingredient.create!(name: "Hebrew National hot dog", calories: 4)
    bun = Ingredient.create!(name: "bun", calories: 2)
    DishIngredient.create!(dish_id: dinner.id, ingredient_id: hot_dog.id)
    DishIngredient.create!(dish_id: dinner.id, ingredient_id: bun.id)

    visit "/chefs/#{louie.id}"

    click_link "All Ingredients"

    expect(current_path).to eq("/chefs/#{louie.id}/ingredients")
  end
end
