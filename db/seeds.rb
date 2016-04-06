# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

learning_source = LearningSource.new(name: 'Book')
learning_source.save!
tag = Tag.create(name: 'Beginner')
tag.save!
comp = Competency.create(name: 'Ruby')
comp.tags << tag
comp.save!
topic = Competency.create(name: 'Gems', topic: comp)
topic.learning_sources << learning_source
topic.save!

u = User.new
u.competencies << comp
u.user_competencies.first.level = 'Great'
u.user_competencies.first.assessor = u
u.save!
