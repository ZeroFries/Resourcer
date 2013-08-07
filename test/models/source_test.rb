require 'test_helper'

class SourceTest < ActiveSupport::TestCase
  setup do
  	@source = FactoryGirl.create :source
  end

  test "sources must have a name" do
  	@source.name = ""

  	assert !@source.save
  end

  test "sources must have a url before being posted" do
  	@source.url = ""
    
  	assert !@source.save
  end

  test "sources must have a unique url" do
    @source2 = FactoryGirl.build :source

    assert !@source2.save
  end

  test "sources must have a category" do
  	@source.category = ""

  	assert !@source.save
  end

  test "sources must have a price" do
  	@source.price = nil

  	assert !@source.save
  end

  test "price must be between 0 and 4" do
  	@source.price = 5

  	assert !@source.save

  	@source.price = -1

  	assert !@source.save
  end

  test "sources must have a summary" do
  	@source.summary = ""

  	assert !@source.save
  end

  test "sources have a topic" do
    @topic = FactoryGirl.create :topic
    @source.url = "whatsup.com"
    @skill = FactoryGirl.create :skill, source: @source, topic: @topic
    assert_equal @source.topics.first.name, "HTML"
  end
end
