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
		@topic = Topic.find params[:topic_id]
		@skill = Skill.find params[:skill_id]
		@source = Skill.create topic: @topic, name: @skill.name, source: Source.create(source_params, admin_approved?: false)
		redirect_to topic_path(@topic), notice: "Thanks for submitting a resource! It will be placed as soon as an admin fills out the details"
	end


	private

		def source_params
			params.require(:source).permit :name, :url
		end
end
