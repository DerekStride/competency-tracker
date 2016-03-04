# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tag = Tag.create(name: 'Beginner')
tag.save!
comp = Competency.create(name: 'Ruby')
comp.tags << tag
comp.save!
topic = Topic.create(name: 'Gems', competency: comp)
topic.save!
