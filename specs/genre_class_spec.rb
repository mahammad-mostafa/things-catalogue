require_relative '../genre_class'
require_relative '../item_class'
require 'date'

describe 'Tests the Genre Class' do
  before :all do
    @object = Genre.new('Jazz', 1)
    @item = Item.new((Date.today - 6000), 1)
  end

  it 'tests if the item instance is passed into the items array in the add_item method' do
    @object.add_item(@item)
    expect { @object.add_item(@item) }.to change { @object.items.length }.by(0)
  end

  it 'tests if the item instance has the genre as and argument' do
    @object.add_item(@item)
    expect(@item.genre).to eq(@object)
  end

  it 'tests if the argument of the add_item is is an instace of item' do
    @object.add_item(@item)
    expect(@item).to be_an_instance_of(Item)
  end

  it 'it should request data from user and instantiate a new genre' do
    allow_any_instance_of(Object).to receive(:gets).and_return("Test Genre\n")
    allow($stdout).to(receive(:write))

    genre = Genre.input_arguments
    expect(genre.instance_variable_get(:@name)).to eq('Test Genre')
  end
end
