class Film < ActiveRecord::Base
   has_and_belongs_to_many :tags
   attr_accessible :name, :year, :rating
   validates_presence_of :name
   RATINGS=[0,6,12,16,18]
end
