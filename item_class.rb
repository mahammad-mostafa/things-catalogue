require 'date'
require 'securerandom'

class Item
  attr_reader :genre, :author, :label, :publish_date

  def initialize(publish_date)
    @publish_date = publish_date
    @id = SecureRandom.uuid
    @archived = false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  private

  def can_be_archived?
    days = (Date.today - @publish_date).to_i
    days / 365.25 > 10
  end
end
