class LinkedListItem

  include Comparable

  def initialize(item)
    @payload = item
    @next_list_item = nil
  end

  attr_reader:payload

  attr_reader:next_list_item

  def next_list_item=(item)
    @next_list_item = item
    raise ArgumentError, 'Next list item cannot be self' if @next_list_item == self
  end

  def last?
    if @next_list_item == nil
      return true
    else
      return false
    end
  end

  def <=>(item)
    self.payload <=> item.payload
  end

  def ===(item)
    self.object_id === item.object_id
  end

end