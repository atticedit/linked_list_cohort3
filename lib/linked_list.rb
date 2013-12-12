class LinkedList

  def add_item(payload)
    if @head.nil?
      @head = LinkedListItem.new(payload)
    else
      @head.next_list_item = LinkedListItem.new(payload)
    end
  end

  def get(index)
    current_node = @head
    index.times do
      current_node = current_node.next_list_item
    end
    current_node.payload
  end

end