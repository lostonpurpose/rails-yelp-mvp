# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Fill the DB with some instances we can use
puts "Cleaning the DB..."
Restaurant.destroy_all

restaurants = [{name: "Turd Burger", address: "88 Fart Street", category: "chinese"}, 
{name: "Ankle Cheese", address: "87 Fart Street", category: "french"},
{name: "Poopsicle", address: "82 Diarrhea Lane", category: "french"},
{name: "Curdled Milk Duds", address: "87 Delcious Blvd.", category: "french"},
{name: "Shart!", address: "100 Fart Street", category: "french"},
]

puts "Creating #{restaurants.count} Restaurants..."

restaurants.each do |restaurant|
  Restaurant.create!(restaurant)
end

puts "... created #{Restaurant.count} restaurants"
