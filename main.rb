require 'pry'
require 'pry-byebug'

class LinkedList
  attr_accessor :name, :head

  def initialize(name)
    @name = name
    @tail = Node.new(nil, nil)
    @head = Node.new(nil, @tail)
  end

  def to_s(start = @head)
    a = to_a
    puts "( #{a.join(' ) -> ( ')} )"
  end

  def to_a(start = @head.next_node, a = [])
    return a if size.zero?
    return a << start if start == last_node

    to_a(start.next_node, a << start)
  end

  def size(tmp = @head.next_node, iteration = 0)
    return iteration if tmp == @tail

    iteration += 1
    size(tmp.next_node, iteration)
  end

  def last_node(start = @head)
    if size == 0
      nil
    elsif start.next_node == @tail
      start
    else
      last_node(start.next_node)
    end
  end

  def first_node
    @head.next_node
  end

  def append(value)
    tmp = size.zero? ? @head : last_node
    node = Node.new(value, @tail)
    tmp.next_node = node
  end

  def prepend(value)
    node = Node.new(value, @head.next_node)
    @head.next_node = node
  end

  # Trzeba dodać kilka przypadków.
  def insert_at(value, index)
    node = Node.new(value, at(index))
    if index == 0
      @head.next_node = node
    else
      at(index - 1).next_node = node
    end
  end

  def remove_at(index)
    return if empty?
    return if at(index).nil?

    node = at(index)
    at(index - 1).next_node = at(index + 1) unless index == 0
    @head.next_node = at(index + 1)
    node.next_node = nil
  end

  def each(node = @head.next_node, &block)
    return if node == @tail

    raise 'No block given.' unless block_given?

    yield node
    each(node.next_node, &block)
  end

  def at(index, node = @head.next_node, i = 0)
    return node if index == i
    return nil if node.nil?

    at(index, node.next_node, i + 1)
  end

  def pop(node = @head)
    if size.zero?
      nil
    elsif node.next_node.next_node == @tail
      node.next_node.next_node = nil
      node.next_node = @tail
      self
    else
      pop(node.next_node)
    end
  end

  def empty?
    size.zero?
  end

  def empty!
    return if empty?

    pop
    empty!
  end

  def contains?(value)
    each do |e|
      return true if e.value == value
    end
    false
  end

  def find(value)
    i = 0
    each do |e|
      return i if e.value == value

      i += 1
    end
    "#{value} not found."
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def to_s
    value.to_s
  end
end

list = LinkedList.new('first_list')
list.append('appended')
list.append('appended 2')
list.prepend('prepened')
puts list
