# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
[Spot].each &:delete_all

spots = [
  { name: "SPOT1", key: "spot1" },
  { name: "SPOT2", key: "spot2" },
  { name: "SPOT3", key: "spot3" }
]

spots.each { |spot| Spot.create!(spot) }
