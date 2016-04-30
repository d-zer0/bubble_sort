#For each element in the list, look at that element and the element
#directly to it's right. Swap these two elements so they are in 
#ascending order.

def bubble_sort (array)
	a = 0
	b = 1
	until (array.each_cons(2).all? { |a, b| (a <=> b) <= 0}) == true do
		sort = lambda {array[a] <=> array[b]}
		sort_call = sort.call
		loop do
			case sort_call
			when -1 #don't swap
				a += 1
				b += 1
				break
			when 0 #don't swap
				a += 1
				b += 1
				break
			when 1 #swap
				array.insert(a,array.delete_at(b))
				a += 1
				b += 1
				break
			else #end of array, return to start
				a = 0
				b = 1
				break
			end
		end
	end
	puts array.inspect
end

array = [4, 2, 5, 6, 3, 23, 5546, 234, 234, 6]
bubble_sort(array)