class AddTopicAndSourceIdsToSkill < ActiveRecord::Migration
  def change
    change_table :skills do |t|
    	t.references :topic, index: true
    	t.references :source, index: true
    end
  end
end
