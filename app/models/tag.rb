class Tag < ActiveRecord::Base

  has_and_belongs_to_many :films, uniq: true
  validates_uniqueness_of :name
  validates_presence_of :name
  def self.by_name(name)
  	where(name: name).first_or_create
  end
end
