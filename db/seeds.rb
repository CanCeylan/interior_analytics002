# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Location.create({name: "Outside 1", city: "Marmaris", address: "Zara Outside South", bounds: {"minX"=>-0.5, "maxX"=>190, "minY"=>-0.5, "maxY"=>20}})
Location.create({name: "Outside 2", city: "Marmaris", address: "Zara Outside West", bounds: {"minX"=>-0.5, "maxX"=>25, "minY"=>-0.5, "maxY"=>105}})
Location.create({name: "Store", city: "Marmaris", address: "Zara Store", bounds: {"minX"=>25, "maxX"=>190, "minY"=>20, "maxY"=>105}})
Location.create({name: "Checkout", city: "Marmaris", address: "Zara Checkout", bounds: {"minX"=>120, "maxX"=>190, "minY"=>90, "maxY"=>105}})

