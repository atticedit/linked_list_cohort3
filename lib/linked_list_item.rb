class LinkedListItem

  include Comparable

  def initialize item
    @payload = item
    @next_list_item = nil
  end

  attr_reader:payload

  attr_reader:next_list_item

  def next_list_item= item
    @next_list_item = item
    raise ArgumentError, 'Next list item cannot be self' if @next_list_item == self
  end

  def last?
    if @next_list_item == nil
      true
    else
      false
    end
  end

  def <=> item
    return 1 if self.payload.class == Symbol and item.payload.class == String
    return -1 if self.payload.class == String and item.payload.class == Symbol
    return 1 if self.payload.class == String and item.payload.class == Fixnum
    return -1 if self.payload.class == Fixnum and item.payload.class == String
    self.payload <=> item.payload
  end

  def === item
    self.object_id === item.object_id
  end

end