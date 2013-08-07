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
		@source = Source.new(source_params)
		if @source.save
			Skill.create topic: @topic, name: @skill.name, source: @source
			redirect_to topic_path(@topic), notice: "Thanks for submitting a resource! It will be placed as soon as an admin fills out the details"
		else
			render :new
		end
	end


	private

		def source_params
			params.require(:source).permit :name, :url
		end
end
