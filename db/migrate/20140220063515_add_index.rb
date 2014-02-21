class AddIndex < ActiveRecord::Migration
  def change
  	add_index :films_tags, [ :film_id, :tag_id ], :unique => true, :name => 'by_film_and_tag'
  end
end
