require 'date'
require_relative 'genre_class'
require_relative 'item_class'
require_relative 'album_class'

describe 'Tests the MusicAlbum Class' do
  before :each do
    @object = MusicAlbum.new(false, (Date.today - 6000))
    @item = Item.new(Date.today - 6000)
  end

  it 'tests if the class has the correct instance variables' do
    expect(@object.on_spotify).to be(false)
  end

  it 'tests if the can_be_archived method overwrites the parent' do
    music = MusicAlbum.new(true, (Date.today - 6000))
    expect(music.can_be_archived?).to be(true)
  end

  it 'tests the can be archived method to return true if the parent method and on spotify are true' do
    music = MusicAlbum.new(true, (Date.today - 6000))
    expect(music.can_be_archived?).to be(true)
  end
end
