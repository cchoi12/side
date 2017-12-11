module MoviesHelper
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
