class Film < ActiveRecord::Base
   has_and_belongs_to_many :tags, uniq: true#, before_add: :validation_method
   RATINGS=[0,6,12,16,18]
   attr_accessible :name, :year, :rating
   validates_presence_of :name, :year
   validates_inclusion_of :rating, in: RATINGS
   validates_associated :tags
   # attr_reader :tags
   def add_tag(tag)
        t=Tag.by_name(tag)
		if self.tags.include?(t)
			self.errors.add(:tags, "Tag_id and Film_id must be UNIQUE")
			false
			#puts "#"*10
			#puts self.errors.messages
			#puts "#"*10
		else
			self.tags<<Tag.by_name(tag)
			true
			
		end
   end   
end
