class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, *arguments)
    @publisher = publisher
    @cover_state = cover_state
    super(arguments)
  end

  def self.parse_string(arguments)
    new(arguments['@publisher'], arguments['@cover_state'], arguments['@publish_date'], arguments['@id'])
  end

  def self.input_arguments
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover state: '
    cover_state = gets.chomp
    publish_date = input_date
    new(publisher, cover_state, publish_date)
  end

  private

  def can_be_archived?
    return true if super || @cover_state == 'bad'

    false
  end
end
