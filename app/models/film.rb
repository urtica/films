class Film < ActiveRecord::Base
   has_and_belongs_to_many :tags, uniq: true
   RATINGS=[0,6,12,16,18]
   attr_accessible :name, :year, :rating
   validates_presence_of :name, :year
   validates_inclusion_of :rating, in: RATINGS
   validates_associated :tags
   
end
