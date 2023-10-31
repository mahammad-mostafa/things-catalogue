class Message
  def self.welcome_message
    puts ''
    puts 'Welcome to Things Catalogue App!'
  end

  def self.display_options
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all games'
    puts '4 - List all labels'
    puts '5 - List all genres'
    puts '6 - List all authors'
    puts '7 - Add a book'
    puts '8 - Add a music album'
    puts '9 - Add a game'
    puts '0 - Exit'
    puts ''
  end

  def self.close_message
    puts ''
    puts 'Thank you for using this app'
    puts ''
  end
end
