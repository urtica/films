class CreateFilmsTags < ActiveRecord::Migration
  def change
  	create_table :films_tags, id: false do |t|
  		t.belongs_to :film
  		t.belongs_to :tag
  	end
  end
end
