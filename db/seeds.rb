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

rachel = User.create(name: "Rachel", email: "rr@ff.com", password: "rr", github: "git.rachel.com", cohort_id: 1, admin: true, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRS1RBimSX_vkz4-_gscZ-T7sJpny6PR5H2jsDultToclIJa9JK")
jack = User.create(name: "Jack", email: "jack@ff.com", password: "jack", github: "git.jack.com", cohort_id: 1, admin: true, image: "https://www.iconfinder.com/data/icons/avatar-and-user/86/Avatar_person_user_character_man_woman_human-04-512.png")
vivian = User.create(name: "Vivian", email: "vivi@ff.com", password: "vivi", github: "git.vivi.com", cohort_id: 1, admin: true, image: "https://www.google.com/imgres?imgurl=https%3A%2F%2Fs-media-cache-ak0.pinimg.com%2Foriginals%2Fe9%2F2e%2Fb2%2Fe92eb2f9bbe5336c13818c3eabceb898.png&imgrefurl=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F392305817514442262%2F&docid=pI_xZfVx1ux3dM&tbnid=_H_R9ASa9gneGM%3A&vet=10ahUKEwjkv5H-6pzUAhUH94MKHdT3Cl84ZBAzCEQoQDBA..i&w=281&h=281&bih=978&biw=1421&q=avatar%20icon&ved=0ahUKEwjkv5H-6pzUAhUH94MKHdT3Cl84ZBAzCEQoQDBA&iact=mrc&uact=8")
annee = User.create(name: "Annee", email: "annee@ff.com", password: "annee", github: "git.annee.com", cohort_id: 1, admin: true, image:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqqHpLFTCdVotpZAoBLpYY4SWVN7r7VLVzJg-ElboXw82ZhXTSig")
tony = User.create(name: "Tony", email: "tony@ff.com", password: "tony", github: "git.tony.com", cohort_id: 1, admin: true, image:"https://us.123rf.com/450wm/branche/branche1705/branche170500234/77410098-hipster-avatar-icon.jpg?ver=6")
lindsey = User.create(name: "Lindsey", email: "lindsey@ff.com", password: "lindsey", github: "git.lindsey.com", cohort_id: 1, admin: true, image:"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStA-hsvYJvujgpsvfxsNMP8arZdtBt0tvJHNLx0JJ6uCC0MMvsKA")
ash = User.create(name: "Ash", email: "ash@ff.com", password: "ash", github: "git.ash.com", cohort_id: 2, admin: true, image:"https://68.media.tumblr.com/b447980a26fbe7435e9c7807eb7d93c2/tumblr_nuxt616C8H1snc7jco1_250.png")

# project = Project.new(name: "project 1")
#
# cohort = Cohort.create(nickname: "cohort")
#
# rachel.projects << project
#
# cohort.users << rachel
