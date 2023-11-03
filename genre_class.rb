require_relative 'item_class'
require 'securerandom'
class Genre
  attr_accessor :items
  attr_reader :id

  def initialize(name)
    @id = SecureRandom.uuid
    @name = name
    @items = []
  end

  def add_item(iteminstance)
    @items.append(iteminstance) unless @items.include?(iteminstance)
    iteminstance.add_genre(self) unless iteminstance.genre == self
  end

  def self.parse_string(arguments)
    new(arguments['@name'])
  end
end
