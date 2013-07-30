class CreateJoinStreamTopics < ActiveRecord::Migration
  def change
    create_table :join_stream_topics do |t|
      t.references :stream, index: true
      t.references :topic, index: true

      t.timestamps
    end
  end
end
