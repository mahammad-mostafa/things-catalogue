require_relative 'item_class'
require 'securerandom'
class Genre
  attr_accessor :items

  def initialize(name)
    @id = SecureRandom.uuid
    @name = name
    @items = []
  end

  def add_item(iteminstance)
    @items << iteminstance
    iteminstance.add_genre(self)
  end
end
