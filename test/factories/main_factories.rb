FactoryGirl.define do
	factory :topic do
		name "HTML"
		description "Markup language"
	end

	factory :skill do
		name "Beginner"
		topic
		source
	end

	factory :source do
		name "Wikipedia"
		category "Encyclopedia"
		price 0
		url "http://www.wikipedia.org/"
		summary "Open source content on everything ever"
		image_url "http://upload.wikimedia.org/wikipedia/commons/6/63/Wikipedia-logo.png"
	end

	factory :user do
		name "ZeroFries"
		email "zf@zg.com"
		password "password"
		password_confirmation "password"
	end
end