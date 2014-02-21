class FilmsController < ApplicationController
	helper_method :sort_column
	def index
		
		@films=Film.scoped

		#@films=Film.order(sort_column)
		if params[:rating] 
			@films=@films.where(rating: params[:rating])
			#@films=Film.where(rating: params[:rating]).order(sort_column)
		end
		@films=@films.order(sort_column)
	end
	def show
		@film=Film.where(id: params[:id]).first
		
	end
	def new
		@film=Film.new
	end
    
	def create
		@film=Film.create(params[:film])
		if @film.valid? 
		    redirect_to action: "index"
		else
 			render action: "new"
		end	
	end
	def edit
		@film=Film.where(id: params[:id]).first
	end
	def update
		@film=Film.where(id: params[:id]).first
		@film.update_attributes params[:film]
		if @film.valid?
		    redirect_to action: "show", id: @film.id
		else
 			render action: "edit"
		end	
		
	end
	
	def sort_column
		Film.column_names.include?(params[:sort]) ? params[:sort] : "name"
	end
	def add_tag
		@film=Film.where(id: params[:film_id]).first
		
		#puts film_path(@film)
		if @film.add_tag(params[:name])
			@film.save
			redirect_to film_path(@film)
		else
			render action: "show"
		end
	end

	def destroy
  		@f = Film.find(params[:id])
  		@f.destroy
 
  		redirect_to films_path
	end

	def test_ajax
	    film=Film.find(params[:id])
	    if film.tags.map(&:name).include?(params[:tag])
	  	     render :text=>'false'
	  	else
	  		 render :text=> {}.to_json
	    end
	end
end
