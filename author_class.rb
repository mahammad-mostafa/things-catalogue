class Author
  attr_reader :id, :items
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name, id = Random.rand(1..1000))
    @first_name = first_name
    @last_name = last_name
    @id = id
    @items = []
  end

  def add_item(item)
    @items.append(item) unless @items.any? { |element| element.id == item.id }
    item.add_author(self) unless item.author.id == @id
  end

  def generate_string
    { id: @id, first_name: @first_name, last_name: @last_name }
  end

  def self.input_arguments
    print 'First Name: '
    first_name = gets.chomp
    print 'Last Name: '
    last_name = gets.chomp
    new(first_name, last_name)
  end
end
