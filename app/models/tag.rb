class Tag < ActiveRecord::Base
  has_and_belongs_to_many :films 	
  attr_accessible :name
  def self.by_name(name)
  	where(name: name).first_or_create
  end
end
