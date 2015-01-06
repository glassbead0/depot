# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all

Product.create!(title: 'Programming Ruby 2.1', description: %{<p>Ruby is the fastest growing and most exciting dynamically typed language out there. If you need to get working programs delivered fast, you should add Ruby to your toolbox</p>}, image_url: 'ruby.jpg', price: 49.95)
Product.create!(title: 'Things and such', description: "<p>These are some great things to have around, especially if you don't have a bunch of things, y'know what I'm sayin?'", image_url: 'stuff.jpg', price: 10)
