# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cohort.create(start_date: "042417")
Cohort.create(start_date: "031317")
Cohort.create(start_date: "060517")
Cohort.create(start_date: "051517")

User.create(name: "Rachel", email: "rr@ff.com", password: "rr")
