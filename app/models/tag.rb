class Tag < ActiveRecord::Base

  has_and_belongs_to_many :films, uniq: true, :join_table => :films_tags
  validates_uniqueness_of :name, message: 'Must be uniq'
  validates_presence_of :name, message: 'Must not be blank'
  def self.by_name(name)
  	where(name: name).first_or_create
  end
end
