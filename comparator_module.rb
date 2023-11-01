module Comparator
  def compare_ids(array, id)
    array.each { |element| return element if element.id == id }
  end
end
