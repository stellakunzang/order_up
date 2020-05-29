require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance methods" do
    it "#all_ingredients" do
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

      expect(louie.all_ingredients).to eq("Hebrew National hot dog, bun")
    end
  end
end
