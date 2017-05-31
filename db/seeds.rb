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

rachel = User.create(name: "Rachel", email: "rr@ff.com", password: "rr", github: "something.com", cohort_id: 1, admin: true)
jack = User.create(name: "Jack", email: "jack@ff.com", password: "jack", github: "something.com", cohort_id: 1, admin: true)
dav = User.create(name: "Dav", email: "dav@ff.com", password: "dav", github: "something.com", cohort_id: 1, admin: true)
cod = User.create(name: "Cod", email: "Cod@ff.com", password: "cod", github: "something.com", cohort_id: 1, admin: true)
bob = User.create(name: "Bob", email: "Bob@ff.com", password: "bob", github: "something.com", cohort_id: 1, admin: true)

# project = Project.new(name: "project 1")
#
# cohort = Cohort.create(nickname: "cohort")
#
# rachel.projects << project
#
# cohort.users << rachel
