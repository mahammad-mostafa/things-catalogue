require_relative 'item_class'
require_relative 'genre_class'

require 'date'

class Game < Item
  attr_accessor :last_played_at
  attr_reader :multiplayer

  def initialize(multiplayer, publish_date, last_played_at, id = SecureRandom.uuid)
    super(publish_date, id)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    parent_ans = super
    parent_ans && (@last_played_at < Date.today.prev_year(2))
  end

  def self.input_arguments
    print 'Is multiplayer?'
    multiplayer = gets.chomp
    print 'Publish Date?'
    publish_date = gets.chomp
    last_played_at = Date.today
    new(multiplayer, publish_date, last_played_at)
  end
end
