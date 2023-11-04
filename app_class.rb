require 'json'
require 'date'
require_relative 'item_class'
require_relative 'book_class'
require_relative 'album_class'
require_relative 'game_class'
require_relative 'label_class'
require_relative 'genre_class'
require_relative 'author_class'
require_relative 'storage_module'

class App
  include Storage

  def initialize
    @classes = [Book, MusicAlbum, Game, Label, Genre, Author]
    @lists = { 'book' => [], 'album' => [], 'game' => [], 'label' => [], 'genre' => [], 'author' => [] }
    @options = %w[book album game label genre author]
    load_lists
  end

  def load_lists
    @lists.reverse_each do |key, value|
      items = read_file(key)
      items.each do |item|
        object = list_arguments(key, item)
        create_relations(object, item) if %w[book album game].include?(key)
        value.append(object)
      end
    end
  end

  def list_arguments(type, arguments)
    case type
    when 'book'
      Book.new(arguments['@publisher'], arguments['@cover_state'], arguments['@publish_date'], arguments['@id'])
    when 'album'
      MusicAlbum.new(arguments['@on_spotify'], arguments['@publish_date'], arguments['@id'])
    when 'game'
      Game.new(arguments['@multiplayer'], arguments['@last_played_at'], arguments['@publish_date'], arguments['@id'])
    when 'label'
      Label.new(arguments['title'], arguments['color'], arguments['id'])
    when 'genre'
      Genre.new(arguments['name'], arguments['id'])
    when 'author'
      Author.new(arguments['first_name'], arguments['last_name'], arguments['id'])
    end
  end

  def create_relations(object, item)
    label = @lists['label'].find(nil) { |element| element.id == item['@label']['id'] }
    object.add_label(label) unless label.nil?
    genre = @lists['genre'].find(nil) { |element| element.id == item['@genre']['id'] }
    object.add_genre(genre) unless genre.nil?
    author = @lists['author'].find(nil) { |element| element.id == item['@author']['id'] }
    object.add_author(author) unless author.nil?
  end

  def handle_option(option)
    if option.positive? && option < 7
      handle_list(@lists[@options[option - 1]], @options[option - 1], false)
    elsif option > 6 && option < 10
      add_item(@lists[@options[option - 7]], @classes[option - 7])
    else
      puts 'Wrong number! Try again'
    end
  end

  def handle_list(array, name, selection)
    puts "No available #{name}s!" if array.empty?
    puts "Select the #{name} from the following list by number OR press ZERO to create a new #{name}" if selection
    array.each_with_index do |element, index|
      print "#{index + 1}) " if selection
      list_attribute(element, name)
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
    else
      puts "Title: \"#{object.label.title}\""
    end
  end

  def add_item(array, type)
    label, genre, author = handle_item
    item = type.input_arguments
    item.add_label(label)
    item.add_author(author)
    item.add_genre(genre)
    array.append(item)
    puts "#{type} created successfully"
  end

  def handle_item
    result = []
    (3..5).each do |index|
      handle_list(@lists[@options[index]], @options[index], true)
      object = handle_input(@lists[@options[index]], @classes[index])
      @lists[@options[index]].append(object) unless @lists[@options[index]].include?(object)
      result.append(object)
    end
    result
  end

  def handle_input(array, type)
    option = gets.chomp.to_i
    if option.zero?
      type.input_arguments
    elsif option - 1 < array.size
      array[option - 1]
    else
      puts 'Invalid input! Please try again'
      handle_input(array, type)
    end
  end

  def handle_exit
    @lists.each do |key, value|
      write_file(key, value)
    end
  end
end
