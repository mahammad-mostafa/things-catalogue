require 'securerandom'

class Author
  attr_reader :items
  attr_accessor :first_name, last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @id = SecureRandom.uuid
    @items = []
  end

  def add_item(item)
    @items.append(item)
    item.add_author(self)
  end
end