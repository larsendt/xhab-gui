# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
[Spot].each &:delete_all

spots = [
  { name: "SPOT-1", key: "spot1" },
  { name: "SPOT-2", key: "spot2" },
  { name: "SPOT-3", key: "spot3" },
  { name: "SPOT-4", key: "spot4" }
]

spots.each { |spot| Spot.create!(spot) }
