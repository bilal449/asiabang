# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bodybuilding = Category.where(name: "Bodybuilding").first_or_create(name: "Bodybuilding")
coaching = Category.where(name: "Coaching").first_or_create(name: "Coaching")
crossfit = Category.where(name: "Crossfit").first_or_create(name: "Crossfit")
massage = Category.where(name: "Massage").first_or_create(name: "Massage")
meditation = Category.where(name: "Meditation").first_or_create(name: "Meditation")
yoga = Category.where(name: "Yoga").first_or_create(name: "Yoga")

denmark = Country.where(name: "Denmark").first_or_create(name: "Denmark")
finland = Country.where(name: "Finland").first_or_create(name: "Finland")
norway = Country.where(name: "Norway").first_or_create(name: "Norway")
sweden = Country.where(name: "Sweden").first_or_create(name: "Sweden")
united_kingdom = Country.where(name: "United Kingdom").first_or_create(name: "United Kingdom")
