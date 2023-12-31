class Item
  attr_reader :id, :archived, :genre, :author, :label, :publish_date

  def initialize(publish_date, id = Random.rand(1..1000))
    @publish_date = publish_date
    @id = id
    @archived = false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_label(label)
    @label = label
    @label.add_item(self) unless @label.items.any? { |item| item.id == @id }
  end

  def add_genre(genre)
    @genre = genre
    @genre.add_item(self) unless @genre.items.any? { |item| item.id == @id }
  end

  def add_author(author)
    @author = author
    @author.add_item(self) unless @author.items.any? { |item| item.id == @id }
  end

  def generate_string
    hash = {}
    hash[:@type] = self.class
    instance_variables.each do |variable|
      value = instance_variable_get(variable)
      value = value.generate_string if value.respond_to?(:generate_string)
      value = value.to_s if value.is_a?(Date)
      hash[variable] = value
    end
    hash
  end

  def self.input_date(type = 'day', date = [])
    case type
    when 'day'
      date.append(validate_date(type, 31))
      input_date('month', date)
    when 'month'
      date.append(validate_date(type, 12))
      input_date('year', date)
    when 'year'
      date.append(validate_date(type, Date.today.year))
      Date.new(date[2], date[1], date[0])
    end
  end

  def self.validate_date(type, limit)
    print "Publish date #{type}: "
    number = gets.chomp.to_i
    return number if number.is_a?(Integer) && number.positive? && number <= limit

    puts "Invalid value! Please enter a positive number less than #{limit}"
    validate_date(type, limit)
  end

  private

  def can_be_archived?
    days = (Date.today - @publish_date).to_i
    days / 365.25 > 10
  end
end
