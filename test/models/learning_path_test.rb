require 'test_helper'

class LearningPathTest < ActiveSupport::TestCase
  test "learning paths have nodes and requirements" do
  	@requirement = FactoryGirl.create :requirement, source: Source.first
  	@node = FactoryGirl.create :node, requirements: [@requirement], skill: Skill.first
  	@learning_path = FactoryGirl.create :learning_path, nodes: [@node]
  	assert @learning_path.nodes.count > 0
  	assert @learning_path.requirements.count > 0
  end
end
