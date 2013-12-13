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
    return @head if @head == nil
    current_node = @head
    until current_node.last? do
      current_node = current_node.next_list_item
    end
    current_node.payload
  end

  def to_s
    if @head == nil
      string = ""
    else @head.next_list_item == nil
      string = "#{@head.payload}"
      current_node = @head.next_list_item
      while current_node do
        string << ", #{current_node.payload}"
        current_node = current_node.next_list_item
      end
      string << " "
    end
    return "| #{string}|"
  end

end