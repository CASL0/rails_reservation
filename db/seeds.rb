# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

places = ["東京", "大阪", "福岡", "札幌", "仙台", "名古屋", "金沢"]
40.times do |n|
  Room.create(
    name: "会議室\#%02d" % n,
    place: places.sample,
    number: rand(5..30)
  )
end
