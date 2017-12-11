class Event < ApplicationRecord

  scope :upcoming, ->{where("starts_at >= ?", Time.now).order(:starts_at)}

  def free?
    price.blank? || price.zero?
  end
end
