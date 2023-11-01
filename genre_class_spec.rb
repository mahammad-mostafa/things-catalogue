require_relative 'genre_class'
require_relative 'item_class'

describe 'Tests the Genre Class' do
  before :each do
    @object = Genre.new('Jazz')
    @item = Item.new(Date.today - 6000)
  end

  it 'tests if the item instance is passed into the items array in the add_item method' do
    @object.add_item(@item)
    expect(@object.items).to include(@item)
  end

  it 'tests if the item instance has the genre as and argument' do
    @object.add_item(@item)
    expect(@item.genre).to eq(@object)
  end

  it 'tests if the argument of the add_item is is an instace of item' do
    @object.add_item(@item)
    expect(@item).to be_an_instance_of(Item)
  end
end
