# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :node do
    topic nil
    skill nil
    state "MyString"
  end
end
