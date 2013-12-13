class LinkedList

  def initialize(item = nil)
    @payload = item
  end

  def add_item(payload)
    if @head == nil
      @head = LinkedListItem.new(payload)
    else
      current_node = @head
      while current_node.last? == false
        current_node = current_node.next_list_item
      end
      current_node.next_list_item = LinkedListItem.new(payload)
    end
  end

  def get(index)
    current_node = @head
    index.times do
      raise IndexError, 'Item at index number does not exist' if current_node.nil?
      current_node = current_node.next_list_item
    end
    raise IndexError, 'Index number cannot be negative' if index < 0
    current_node.payload
  end

  def size
    count = 0
    current_node = @head
    until current_node == nil do
      current_node = current_node.next_list_item
      count += 1
    end
    count
  end

  def last
    if @head == nil
      @head
    end
  end

end