class Admin::SourcesController < ApplicationController
	before_filter :admin_only, only: [:index, :edit, :update]

	def edit
		@source = Source.find params[:id]
	end

	def index
		# collection of unapproved resources which need fleshing out
		@sources = Source.where(admin_approved?: false)
	end

	def update
		@source = Source.find params[:id]
		#@source.admin_approved? = true
	end

	def destroy
		@source = Source.find params[:id]
		@source.destroy
	end

	private

		def source_params
			params.require(:source).permit :name, :url, :image_url, :summary, :price, :category
		end
end
