require_relative 'book_class'
require_relative 'album_class'
require_relative 'game_class'
require_relative 'label_class'
require_relative 'genre_class'
require_relative 'author_class'

require 'date'

class App
  attr_reader :games

  def initialize
    @books = []
    @albums = []
    @games = []
    @labels = []
    @genres = []
    @authors = []
  end

  def handle_option(option)
    if option.positive? && option < 7
      listing_items(option)
    elsif option > 6 && option < 10
      adding_item(option)
    else
      puts 'Wrong number! Try again'
    end
  end

  def listing_items(option)
    case option
    when '1'
      list_books
    when '2'
      list_albums
    when '3'
      list_games
    when '4'
      list_labels
    when '5'
      list_genres
    when '6'
      list_authors
    end
  end

  def adding_item(option)
    case option
    when '7'
      add_book
    when '8'
      add_album
    when '9'
      add_game
    end
  end

  def list_authors
    return puts 'No available authors!' if @authors.empty?

    @authors.each do |a|
      puts a.first_name
    end
  end

  def add_game(multiplayer, genre, author, label, publish_date)
    last_played_at = Date.today
    new_game = Game.New(multiplayer, last_played_at, genre, author, label, publish_date)
    @games.append(new_game)
  end
end
