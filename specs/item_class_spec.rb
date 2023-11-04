require 'date'
require_relative '../item_class'

describe('Tests for Item class methods') do
  it('Construtor method should return an instance of Item class') do
    # Arrange
    publish_date = Date.new(2010, 10, 10)
    # Act
    item = Item.new(publish_date)
    # Assert
    expect(item).to(be_instance_of(Item))
  end

  it('move_to_archive method should set archived to true') do
    # Arrange
    item = Item.new(Date.new(2010, 10, 10))
    # Act
    result = item.move_to_archive
    # Assert
    expect(result).to(eq(true))
  end

  it('add_label method should successfuly associate the item with its label') do
    # Arrange
    item = Item.new(Date.new(2010, 10, 10))
    label = Label.new('title', 'cyan')
    # Act
    item.add_label(label)
    # Assert
    expect(item.label).to(eq(label))
    expect(label.items).to(include(item))
  end

  it('add_genre method should successfuly associate the item with its genre') do
    # Arrange
    item = Item.new(Date.new(2010, 10, 10))
    genre = Genre.new('name')
    # Act
    item.add_genre(genre)
    # Assert
    expect(item.genre).to(eq(genre))
    expect(genre.items).to(include(item))
  end

  it('add_author method should successfuly associate the item with its author') do
    # Arrange
    item = Item.new(Date.new(2010, 10, 10))
    author = Author.new('first', 'last')
    # Act
    item.add_author(author)
    # Assert
    expect(item.author).to(eq(author))
    expect(author.items).to(include(item))
  end

  it('generate_string method should return a hash with instance variables of Item class') do
    # Arrange
    item = Item.new(Date.new(2010, 10, 10), 1)
    # Act
    hash = item.generate_string
    # Assert
    expect(hash).to(eq({ :@type => Item, :@publish_date => '2010-10-10', :@id => 1, :@archived => false }))
  end

  it('input_date method should return a date object') do
    # Arrange
    allow($stdout).to(receive(:write))
    allow(Item).to(receive(:gets)).and_return('10', '10', '2010')
    # Act
    publish_date = Item.input_date
    # Assert
    expect(publish_date).to(eq(Date.new(2010, 10, 10)))
  end

  it('validate_date method should return user input if value is valid') do
    # Arrange
    allow($stdout).to(receive(:write))
    allow(Item).to(receive(:gets)).and_return('10')
    # Act
    day = Item.validate_date('day', 31)
    # Assert
    expect(day).to(eq(10))
  end
end
