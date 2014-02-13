class AddFilmsRating < ActiveRecord::Migration
  def up
  	 add_column :films, :rating, :integer
  end

  def down
  	 remove_column :films, :rating
  end
end
