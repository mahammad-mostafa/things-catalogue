require_relative 'item_class'
require_relative 'book_class'
require_relative 'album_class'
require_relative 'game_class'
require_relative 'label_class'
require_relative 'genre_class'
require_relative 'author_class'
require_relative 'storage_module'
require_relative 'comparator_module'

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
    when 1
      list_static(@books, 'books')
    when 2
      list_static(@albums, 'albums')
    when 3
      list_static(@games, 'games')
    when 4
      list_dynamic(@labels, 'label')
    when 5
      list_dynamic(@genres, 'genre')
    when 6
      list_dynamic(@authors, 'author')
    end
  end

  def adding_item(option)
    case option
    when 7
      add_book
    when 8
      add_album
    when 9
      add_game
    end
  end

  def list_static(array, name)
    return puts "No available #{name}!" if array.empty?

    array.each do |element|
      puts "Title: \"#{element.label.title}\""
    end
  end

  def list_dynamic(array, name, indexed: false)
    return puts "No available #{name}s!" if array.empty? && !indexed

    puts "Select a #{name} from the following list by number OR press ZERO to create a new #{name}" if indexed
    index = 1
    array.each do |element|
      print "#{index}) " if indexed
      list_attribute(element, name)
      index += 1
    end
  end

  def list_attribute(object, name)
    case name
    when 'label'
      puts "Title: \"#{object.title}\""
    when 'genre'
      puts "Name: \"#{object.name}\""
    when 'author'
      puts "Name: \"#{object.first_name} #{object.last_name}\""
    end
  end

  def add_book
    list_dynamic(@books, 'book', true)
    book = gets.chomp.to_i
    list_dynamic(@books, 'book', true)
    people = gets.chomp.to_i
    puts book
    puts people
  end

  def handle_exit
    # s
  end

  def add_game
    #implement genre, label, etc objects logic
    new_game = Game.input_arguments
    @games.append(new_game)
  end

  def select_genre
    #show genere list or create new
  end

  def select_label
    #show label list or create new
  end

  def select_author
    #show author list or create new
  end
end
