# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Topic.destroy_all
Skill.destroy_all
Source.destroy_all
LearningPath.destroy_all
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(:users)
ActiveRecord::Base.connection.reset_pk_sequence!(:skills)
ActiveRecord::Base.connection.reset_pk_sequence!(:topics)
ActiveRecord::Base.connection.reset_pk_sequence!(:learning_paths)
ActiveRecord::Base.connection.reset_pk_sequence!(:sources)

user = User.create name: "Zero", email: "sg@sg.com", password: "password", password_confirmation: "password", admin: true

topic = Topic.create name: "HTML", description: "Mark up language"
topic2 = Topic.create name: "Ruby", description: "Beauty"

wiki = Source.create!(name: "Wikipedia", category: "Encyclopedia", price: 0,
url: "http://www.wikipedia.org/",
summary: "Wikipedia is a multilingual, web-based, free-content encyclopedia project operated 
by the Wikimedia Foundation and based on an openly editable model. The name \"Wikipedia\" is 
a portmanteau of the words wiki (a technology for creating collaborative websites, from 
the Hawaiian word wiki, meaning \"quick\") and encyclopedia. Wikipedia's articles provide 
links to guide the user to related pages with additional information.",
image_url: "http://upload.wikimedia.org/wikipedia/commons/6/63/Wikipedia-logo.png")
wiki.admin_approved = true
wiki.save!

10.times do |i|
	Skill.create topic: topic, source: wiki, name: "Skill #{i}"
	Skill.create topic: topic2, source: wiki, name: "Skill #{i}"
end

node = Node.create topic: topic, skill: topic.skills.first
requirement = node.requirements.create source: wiki
node2 = Node.create topic: topic2, skill: topic2.skills.first
requirement2 = node2.requirements.create source: wiki
learningpath = LearningPath.create name: "Ruby on Rails", nodes: [node, node, 2]