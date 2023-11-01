require 'securerandom'

class Label
  attr_reader :id, :items
  attr_accessor :title, :color

  def initialize(title, color, id = SecureRandom.uuid)
    @title = title
    @color = color
    @id = id
    @items = []
  end

  def add_item(item)
    @items.append(item) unless @items.include?(item)
    item.add_label(self) unless item.label == self
  end

  def self.parse_string(arguments)
    new(arguments['@title'], arguments['@color'], arguments['@id'])
  end
end
