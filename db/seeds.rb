# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Location.create({name: "Zone 1", city: "Marmaris", address: "Asiklar Tepesi On", bounds: {"minX"=>-0.5, "maxX"=>80, "minY"=>-0.5, "maxY"=>140}})
Location.create({name: "Zone 2", city: "Marmaris", address: "Asiklar Tepesi Arka", bounds: {"minX"=>-0.5, "maxX"=>80, "minY"=>70, "maxY"=>140}})
