class Genre
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name, id = Random.rand(1..1000))
    @id = id
    @name = name
    @items = []
  end

  def add_item(iteminstance)
    @items << iteminstance unless @items.any? { |element| element.id == iteminstance.id }
    iteminstance.add_genre(self) unless iteminstance.genre.id == @id
  end

  def generate_string
    { id: @id, name: @name }
  end

  def self.input_arguments
    print 'Name: '
    name = gets.chomp
    new(name)
  end
end
