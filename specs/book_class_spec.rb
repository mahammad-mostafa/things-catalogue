require 'date'
require_relative '../item_class'
require_relative '../book_class'

describe('Tests for Book class methods') do
  it('Construtor method should return an instance of Book class') do
    # Arrange
    publisher = 'publisher'
    cover_state = 'good'
    publish_date = Date.new(2020, 2, 2)
    # Act
    book = Book.new(publisher, cover_state, publish_date)
    # Assert
    expect(book).to(be_instance_of(Book))
  end

  it('input_arument method should return an instance of Book class') do
    # Arrange
    allow($stdout).to(receive(:write))
    allow(Book).to(receive(:gets)).and_return('publisher', 'good')
    allow(Item).to(receive(:gets)).and_return('2', '2', '2020')
    # Act
    book = Book.input_arguments
    # Assert
    expect(book).to(be_instance_of(Book))
  end
end
