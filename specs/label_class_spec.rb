require 'date'
require_relative '../item_class'
require_relative '../label_class'

describe('Tests for Label class methods') do
  it('Construtor method should return an instance of Label class') do
    # Arrange
    title = 'title'
    color = 'cyan'
    # Act
    label = Label.new(title, color)
    # Assert
    expect(label).to(be_instance_of(Label))
  end

  it('add_item method should successfuly associate the item with its label') do
    # Arrange
    item = Item.new(Date.new(2020, 2, 2))
    label = Label.new('title', 'cyan')
    # Act
    label.add_item(item)
    # Assert
    expect(label.items).to(include(item))
    expect(item.label).to(eq(label))
  end

  it('generate_string method should return a hash with instance variables of Label class') do
    # Arrange
    label = Label.new('title', 'cyan', 1)
    # Act
    hash = label.generate_string
    # Assert
    expect(hash).to(eq({ id: 1, title: 'title', color: 'cyan' }))
  end

  it('input_arument method should return an instance of Label class') do
    # Arrange
    allow($stdout).to(receive(:write))
    allow(Label).to(receive(:gets)).and_return('title', 'cyan')
    # Act
    label = Label.input_arguments
    # Assert
    expect(label).to(be_instance_of(Label))
  end
end
