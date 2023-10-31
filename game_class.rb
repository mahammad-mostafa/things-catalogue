require_relative 'item_class'

class Game < Item
  attr_accessor :last_played_at
  attr_reader :multiplayer

  def initialize(multiplayer, last_played_at, genre, author, label, publish_date)
    super(genre, author, label, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    @last_played_at < Date.today.prev_year(2)
  end
end
