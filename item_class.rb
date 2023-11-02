require 'date'
require 'securerandom'

class Item
  attr_reader :id, :archived
  attr_accessor :genre, :author, :label, :publish_date

  def initialize(publish_date, id = SecureRandom.uuid)
    @publish_date = publish_date
    @id = id
    @archived = false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_genre(genre)
    @genre = genre
    @genre.add_item(self) unless @genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    @author.add_item(self) unless @author.items.include?(self)
  end

  def add_label(label)
    @label = label
    @label.add_item(self) unless @label.items.include?(self)
  end

  def generate_string
    hash = {}
    hash['type'] = self.class
    instance_variables.each do |variable|
      value = instance_variable_get(variable)
      value = value.generate_string if value.respond_to?(:generate_string)
      value = value.to_s if value.is_a?(Date)
      hash[variable] = value
    end
    hash
  end

  def self.parse_string(*arguments)
    new(*arguments)
  end

  def input_date
    print 'Publish date day: '
    day = gets.chomp
    print 'Publish date month: '
    month = gets.chomp
    print 'Publish date year: '
    year = gets.chomp
    Date.new(year, month, day)
  end

  private

  def can_be_archived?
    days = (Date.today - @publish_date).to_i
    days / 365.25 > 10
  end
end
