require_relative 'item_class'
require_relative 'genre_class'

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
    super.add_label(label)
  end

  def can_be_archived?
    parent_ans = super
    parent_ans && (@last_played_at < Date.today.prev_year(2))
  end

  # def generate_string
  #   { multiplayer: @multiplayer, last_played_at: @last_played_at, genre: super.genre.generate_string, author: super.author.generate_string, label: super.label.generate_string, publish_date: super.publish_date.generate_string}
  # end

  def self.parse_string(arguments)
    # new(arguments['multiplayer'], arguments['last_payed_at'], Genre.parse_string(arguments['']))
  end

  def self.input_arguments
    print 'Is multiplayer?'
    multiplayer = gets.chomp
    last_played_at = Date.today
    # print 'What genre is it?'
    # gnr = gets.chomp
    # print 'Who is the author?'
    # athr = gets.chomp
    # print ''
    new(multiplayer,last_played_at)
  end
end
