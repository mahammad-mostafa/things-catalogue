class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, *arguments)
    @on_spotify = on_spotify
    super(*arguments)
  end

  def can_be_archived?
    super && @on_spotify ? true : false
  end

  def self.input_arguments
    print 'On spotify (Y/N): '
    on_spotify = gets.chomp.upcase == 'Y'
    publish_date = Item.input_date
    new(on_spotify, publish_date)
  end
end
