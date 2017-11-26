class AddFieldsToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :release_date, :datetime
    add_column :movies, :description, :text
  end
end
