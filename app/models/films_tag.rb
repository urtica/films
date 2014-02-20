class FilmsTag < ActiveRecord::Base
   
   attr_accessible :film_id, :tag_id
   validates_presence_of :film_id, :tag_id
   validates_uniqueness_of :film_id, :tag_id  

end