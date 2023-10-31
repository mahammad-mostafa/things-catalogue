require_relative 'item_class'
require 'date'

class Game < Item
  attr_accessor :last_played_at
  attr_reader :multiplayer

  def initialize(multiplayer, last_played_at, genre, author, label, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    super.add_genre(genre)
    super.add_author(author)
    super.label(label)
  end

  def can_be_archived?
    parent_ans = super
    parent_ans && (@last_played_at < Date.today.prev_year(2))
  end

  def generate_string
    { multiplayer: @multiplayer, last_played_at: @last_played_at, genre, author, label, publish_date}
  end

  def parse_string(arguments)
    new(arguments['multiplayer'], arguments['last_payed_at'])
  end
end
