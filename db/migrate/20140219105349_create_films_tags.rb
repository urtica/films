class CreateFilmsTags < ActiveRecord::Migration
  def up

  	create_table :films_tags do |t|
  		t.belongs_to :film
  		t.belongs_to :tag
  	end
  end

  def down
  end
end
