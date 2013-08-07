class SourcesController < ApplicationController
  before_filter :admin_only, only: [:index, :edit, :update]

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
		@source = Skill.create topic: @topic, name: @skill.name, source: Source.create(source_params, admin_approved? = false)
		# send email to admin? or find some other way to collect unapproved sources
	end

	def edit
	end

	def index
		# collection of unapproved resources which need fleshing out
		@sources = Source.where admin_approved?: false
	end

	def update
		@source = Source.find params[:id]
		@source.admin_approved? = true
	end

	def destroy
	end

	private

		def source_params
			params.require(:source).permit :name, :url
		end
end
