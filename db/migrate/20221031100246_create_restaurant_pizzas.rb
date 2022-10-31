class CreateRestaurantPizzas < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurant_pizzas do |t|
      t.belongs_to :restaurant, index: true, foreign_key: true
      t.belongs_to :pizza, index: true, foreign_key: true
      t.integer :price

      t.timestamps
    end
  end
end
