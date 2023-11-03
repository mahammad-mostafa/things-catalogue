require 'date'

require_relative '../genre_class'
require_relative '../item_class'
require_relative '../game_class'

describe 'Test the Game Class' do
  before :each do
    @object = Game.new(true, (Date.today - 6000), (Date.today - 6000))
  end

  it 'test if the class has the correct multiplayer value' do
    expect(@object.multiplayer).to be(true)
  end

  it 'test if the class has the correct last_played_at value' do
    expect(@object.last_played_at).to eq((Date.today - 6000))
  end

  it 'tests if the can_be_archived method returns true for 10+ years of publish date and 2+ years of last played' do
    game = Game.new(true, (Date.today - 800), (Date.today - 6000))
    expect(game.can_be_archived?).to be(true)
  end

  it 'tests if the can_be_archived method returns false for 10+ years of publish date and 2- years of last played' do
    game = Game.new(true, Date.today, Date.today - 6000)
    expect(game.can_be_archived?).to be(false)
  end

  it 'tests if the can_be_archived method returns false for 10- years of publish date and 2- years of last played' do
    game = Game.new(true, Date.today, Date.today)
    expect(game.can_be_archived?).to be(false)
  end

  it 'it should request data from user and instantiate a new game' do
    allow($stdout).to(receive(:write))
    allow_any_instance_of(Object).to receive(:gets).and_return('Y')
    allow(Item).to receive(:input_date).and_return(Date.new(2020, 11, 3))
    expect(Game).to receive(:new).with(true, Date.today, Date.new(2020, 11, 3))
    Game.input_arguments
  end

  it 'should request data from user and correcly preserve data' do
    allow($stdout).to(receive(:write))
    allow_any_instance_of(Object).to receive(:gets).and_return('Y')
    allow(Item).to receive(:input_date).and_return(Date.new(2020, 11, 3))
    game = Game.input_arguments
    expect(game.instance_variable_get(:@multiplayer)).to eq(true)
    expect(game.instance_variable_get(:@last_played_at)).to eq(Date.today)
  end
end
