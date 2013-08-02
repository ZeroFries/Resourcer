# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :requirement do
    node nil
    completed 1
    goal 1
    state "MyString"
  end
end
