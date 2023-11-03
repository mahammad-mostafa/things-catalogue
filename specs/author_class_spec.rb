require 'date'
require_relative '../author_class'
require_relative '../item_class'

describe 'Test the Author Class' do
  before :each do
    @object = Author.new('Miguel', 'Saavedra')
    @item = Item.new(Date.today - 6000)
    @item.add_author(@object)
  end

  it 'test if the item instance is passed into the items array in the add_item method' do
    @object.add_item(@item)
    expect(@object.items).to include(@item)
  end

  it 'test if the item instance has the author as an atribute' do
    @object.add_item(@item)
    expect(@item.author).to eq(@object)
  end

  it 'test if the argument passed to add_item method of author class is instance of item' do
    expect(@item).to be_an_instance_of(Item)
  end

  it 'test user input and instance of class be of type Author' do
    allow_any_instance_of(Object).to receive(:gets).and_return('TestFirstName', 'TestLastName')
    author = Author.input_arguments
    expect(author.instance_variable_get(:@first_name)).to eq('TestFirstName')
    expect(author.instance_variable_get(:@last_name)).to eq('TestLastName')
  end
end