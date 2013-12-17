class LinkedList

  def initialize *payloads
    @head = nil
    payloads.each do |payload|
      add_item payload
    end
  end

  def add_item payload
    if @head.nil?
      @head = LinkedListItem.new payload
    else
      current_item = @head
      until current_item.last?
        current_item = current_item.next_list_item
      end
      current_item.next_list_item = LinkedListItem.new payload
    end
  end

  def retrieve i
    current_item = @head
    i.times do
      raise IndexError, 'Item at index number does not exist' if current_item.nil?
      current_item = current_item.next_list_item
    end
    raise IndexError, 'Index number cannot be negative' if i < 0
    current_item
  end

  def get i
    current_item = retrieve i
    current_item.payload
  end

  def size
    count = 0
    current_item = @head
    until current_item.nil? do
      current_item = current_item.next_list_item
      count += 1
    end
    count
  end

  def last
    return @head if @head.nil?
    current_item = @head
    until current_item.last? do
      current_item = current_item.next_list_item
    end
    current_item.payload
  end

  def to_s
    if @head.nil?
      string = ""
    else
      string = "#{@head.payload}"
      current_item = @head.next_list_item
      while current_item do
        string << ", #{current_item.payload}"
        current_item = current_item.next_list_item
      end
      string << " "
    end
    "| #{string}|"
  end

  def [] i
    get i
  end

  def []= i, payload
    current_item = retrieve i
    current_item.payload = payload
  end

  def remove i
    current_item = retrieve i
    if current_item.last?
      previous_item = retrieve (i - 1)
      previous_item.next_list_item = nil
    elsif current_item == @head
      @head = current_item.next_list_item
    end
  end

end