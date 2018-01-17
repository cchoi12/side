require 'rails_helper'
require 'capybara/rails'

describe 'Deleting a review' do
  setup do
     Capybara.current_driver = Capybara.selenium
  end

  it 'destroying the review should remove it from the index and redirect' do
    movie = Movie.create(movie_attributes)
    review = movie.reviews.create(review_attributes)

    visit movie_reviews_path(movie)

    find("img[alt='Trash']").click
    # Figure out a way for rspec to click on alert 'ok'
    # expect(page).not_to have_text(review.name)
  end
end
