class TagsController < ApplicationController
	def index
		@tag=Tag.all
	end
	def create
		@tag=Tag.create(params[:tag])
	end
	def new
		@tag=Tag.new
	end
	def update
		@tag=Tag.where(id: params[:id]).first
		@tag.update_attributes params[:tag]
		controller: "films"
	end
	
end
