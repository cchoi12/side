class Movie < ApplicationRecord

  scope :released, -> {where('release_date <= ?', Time.now).order(release_date: :desc)}
  scope :recently_added, -> {order(created_at: :desc).limit(3)}
  scope :highest_gross, -> {where('total_gross > ?', 300_000_000).order(total_gross: :desc)}
  scope :flop, -> {where('total_gross < ?', 50_000_000).order(total_gross: :asc)}

  def flop?
    total_gross.blank? || total_gross < 0.5e8
  end
end
