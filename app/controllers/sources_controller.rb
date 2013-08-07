class SourcesController < ApplicationController
	def show
		@source = Source.find params[:id]
	end

	def new
		@source = Source.new
		@topic = Topic.find params[:topic_id]
		@skill = Skill.find params[:skill_id]
	end

	def create
		put params
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

		def source_params
		end
end
