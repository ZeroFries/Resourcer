# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

topic = Topic.create name: "HTML"
topic2 = Topic.create name: "Ruby", description: "Beauty"

wiki = Source.create(name: "Wikipedia", category: "Encyclopedia", price: 0,
url: "http://www.wikipedia.org/",
summary: "Wikipedia is a multilingual, web-based, free-content encyclopedia project operated 
by the Wikimedia Foundation and based on an openly editable model. The name \"Wikipedia\" is 
a portmanteau of the words wiki (a technology for creating collaborative websites, from 
the Hawaiian word wiki, meaning \"quick\") and encyclopedia. Wikipedia's articles provide 
links to guide the user to related pages with additional information.",
image_url: "http://upload.wikimedia.org/wikipedia/commons/6/63/Wikipedia-logo.png")

10.times do |i|
	Skill.create topic: topic, source: wiki, name: "Skill #{i}"
	Skill.create topic: topic2, source: wiki, name: "Skill #{i}"
end