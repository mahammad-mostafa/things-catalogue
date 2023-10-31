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
end