require "rails_helper"

RSpec.describe "dishes show page" do
  it "should display ingredients for that dish and the chef's name" do
    louie = Chef.create!(name: "Louis")
    dinner = Dish.create!(name: "hot dogs", description: "delicious perfect food", chef_id: louie.id)
    hot_dog = Ingredient.create!(name: "Hebrew National hot dog", calories: 4)
    bun = Ingredient.create!(name: "bun", calories: 2)
    DishIngredient.create!(dish_id: dinner.id, ingredient_id: hot_dog.id)
    DishIngredient.create!(dish_id: dinner.id, ingredient_id: bun.id)

    visit "/dishes/#{dinner.id}"

    expect(page).to have_content("Hebrew National hot dog")
    expect(page).to have_content("bun")
    expect(page).to have_content("Louis")
  end
end
