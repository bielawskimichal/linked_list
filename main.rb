require_relative 'lib/linked_list'

list = LinkedList.new('first_list')
puts "List name: #{list.name}"
list.append('appended')
list.append('appended 2')
list.prepend('prepened')
list.prepend('prepened 2')
puts "List size is: #{list.size}"
puts list.to_a
p "Last node is: #{list.last_node}"
p "First node is: #{list.first_node}"
list.insert_at('inserted at 0', 0)
list.insert_at('inserted at 8', 8)
list.insert_at('inserted at 2', 2)
puts "Node at 0 index is: #{list.at(0)}"
puts "Node at 8 index is: #{list.at(8)}"
puts "Node at 2 index is: #{list.at(2)}"

puts list
p "List size is: #{list.size}"

list.remove_at(2)
puts list
p "List size is: #{list.size}"

i = 0
list.each do |element|
  puts "Element at index #{i} is: #{element}"
  i += 1
end

p "List size is: #{list.size}"
list.pop
puts list
p "List size is: #{list.size}"
p list.empty?

p "Does list contain a given element?: #{list.contains?('inserted at 0')}"
p "Does list contain a given element?: #{list.contains?('inserted at 15')}"

p "Given element index is: #{list.find('inserted at 0')}"
p "Given element index is: #{list.find('inserted at 15')}"

p 'Emptying list...'
list.empty!
p "List size is: #{list.size}"
puts list
