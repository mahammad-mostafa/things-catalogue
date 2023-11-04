class Label
  attr_reader :id, :items
  attr_accessor :title, :color

  def initialize(title, color, id = Random.rand(1..1000))
    @title = title
    @color = color
    @id = id
    @items = []
  end

  def add_item(item)
    @items.append(item) unless @items.any? { |element| element.id == item.id }
    item.add_label(self)
  end

  def generate_string
    { id: @id, title: @title, color: @color }
  end

  def self.input_arguments
    print 'Title: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    new(title, color)
  end
end
