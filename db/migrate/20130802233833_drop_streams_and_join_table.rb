class DropStreamsAndJoinTable < ActiveRecord::Migration
  def change
  	drop_table :join_stream_topics
  	drop_table :streams
  end
end
