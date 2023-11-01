require 'securerandom'

class Author
  attr_accessor :first_name, last_name

  def initialize(first_name, last_name, id = SecureRandom.uuid)
    @first_name = first_name
    @last_name = last_name
    @id = id
    @items = []
  end

  def add_item(item)
    @items.append(item)
    item.add_author(self)
  end

  def generate_string
    { id: @id, first_name: @first_name, last_name: @last_name }
  end

  def self.parse_string(arguments)
    new (arguments['first_name'], arguments['last_name'])
  end

  def self.input_arguments
    print 'First Name?'
    first_name = gets.chomp
    print 'Last Name?'
    last_name = gets.chomp
    new(first_name, last_name)
  end
end