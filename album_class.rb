require_relative 'item_class'
class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, publish_date)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify ? true : false
  end

  def self.input_arguments
    print 'Is it on spotify? (T/F)'
    on_spotify = gets.chomp.downcase
    print 'Publish Date?'
    publish_date = Date.parse(gets.chomp)
    new(on_spotify, publish_date)
  end
end
