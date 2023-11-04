class Game < Item
  attr_accessor :last_played_at, :multiplayer

  def initialize(multiplayer, last_played_at, *arguments)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    super(*arguments)
  end

  def can_be_archived?
    super && (@last_played_at < Date.today.prev_year(2))
  end

  def self.input_arguments
    print 'Is multiplayer(Y/N): '
    multiplayer = gets.chomp.upcase == 'Y'
    last_played_at = Date.today
    publish_date = Item.input_date
    new(multiplayer, last_played_at, publish_date)
  end
end
