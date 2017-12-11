module MoviesHelper
  def movie_image_for movie
    if movie.image_file_name.blank?
      image_tag 'http://via.placeholder.com/350x150'
    else
      image_tag movie.image_file_name
    end
  end

  def price_formatter movie
    if movie.flop?
      content_tag(:strong, 'Flop!')
    else
      number_to_currency movie.total_gross
    end
  end

  def format_date_and_timeago movie
    if movie.release_date.blank?
      'Unknown'
    else
      "#{movie.release_date.strftime('%m/%d/%Y')}(#{time_ago_in_words movie.release_date})"
    end
  end
end
