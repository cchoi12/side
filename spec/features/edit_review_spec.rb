require 'rails_helper'

describe 'Editing a movie review' do
  it 'updates the review and redirects to index' do
    movie = Movie.create(movie_attributes)
    review = movie.reviews.create(review_attributes)

    visit movie_reviews_path(movie)

    click_link 'Edit this review'
    expect(current_path).to eq(edit_movie_review_path(movie, review))

    expect(find_field('Name').value).to eq(review.name)

    fill_in 'Name', with: 'Updated Namebro'

    click_button('Post Review')
    expect(page).to have_text('Update successful')

    expect(current_path).to eq(movie_reviews_path(movie))
    expect(page).to have_text('Updated Namebro')
  end

  it 'does not update the review if validations fail' do
    movie = Movie.create(movie_attributes)
    review = movie.reviews.create(review_attributes)

    visit movie_reviews_path(movie)

    click_link 'Edit this review'
    fill_in 'Name', with: ''

    click_button('Post Review')
    expect(current_path).to eq(movie_review_path(movie, review))

    expect(find_field('Name').value).to eq('')
    expect(page).to have_text('Name can\'t be blank')
  end
end
