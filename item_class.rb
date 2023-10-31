require 'date'
require 'securerandom'

class Item
  attr_reader :genre, :author, :label, :publish_date

  def initialize(publish_date)
    @publish_date = publish_date
    @id = SecureRandom.uuid
    @archived = false
  end
end
