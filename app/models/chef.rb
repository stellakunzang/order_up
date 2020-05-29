class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def all_ingredients
    dishes.joins(:ingredients).distinct.pluck('ingredients.name').join(', ')
  end

  def most_popular_ingredients
    ordered_ingredients = dishes.joins(:ingredients)
                        .select('ingredients.id, ingredients.name')
                        .group('ingredients.id')
                        .order('count(ingredients.id)')
                        .limit(3)
    ordered_ingredients.reverse 
  end
end
