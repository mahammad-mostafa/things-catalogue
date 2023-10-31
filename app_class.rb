require_relative 'book_class'
require_relative 'album_class'
require_relative 'game_class'
require_relative 'label_class'
require_relative 'genre_class'
require_relative 'author_class'

class App
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
end