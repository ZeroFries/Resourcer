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
		url "http://www.wikipedia.orgz/"
		summary "Open source content on everything ever"
		image_url "http://upload.wikimedia.org/wikipedia/commons/6/63/Wikipedia-logo.png"
	end

	factory :user do
		name "ZeroFries"
		email "zf@zg.com"
		password "password"
		password_confirmation "password"
	end

	factory :learning_path do
		name "Ruby on Rails"
	end

	factory :node do
		topic
		skill
		learning_path
	end

	factory :requirement do
		source
		node
	end
end