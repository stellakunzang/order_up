require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "class methods" do
    it "#total_calories" do
      louie = Chef.create!(name: "Louis")
      dinner = Dish.create!(name: "hot dogs", description: "delicious perfect food", chef_id: louie.id)
      hot_dog = Ingredient.create!(name: "Hebrew National hot dog", calories: 4)
      bun = Ingredient.create!(name: "bun", calories: 2)
      DishIngredient.create!(dish_id: dinner.id, ingredient_id: hot_dog.id)
      DishIngredient.create!(dish_id: dinner.id, ingredient_id: bun.id)

      expect(dinner.total_calories).to eq(6)
    end
  end
end
