#This is how the program looked as I was building it. Can be run
#to show how the array changes after each loop of bubble_sort.

#For each element in the list, look at that element and the element
#directly to it's right. Swap these two elements so they are in 
#ascending order.

def bubble_sort (array)

	a = 0
	b = 1
	loop = 0

	until (array.each_cons(2).all? { |a, b| (a <=> b) <= 0}) == true do
		sort = lambda {array[a] <=> array[b]}
		sort_call = sort.call
		#puts sort.call
		
		loop do
			case sort_call
			when -1
				#don't swap
				puts "=== NO SWAP ==="
				puts "#{array[a]} is not greater than #{array[b]}"
				puts array.inspect
				a += 1
				b += 1
				break
			when 0
				#don't swap
				puts "=== NO SWAP ==="
				puts "#{array[a]} is not greater than #{array[b]}"
				puts array.inspect
				a += 1
				b += 1
				break
			when 1
				#swap
				#puts array.inspect
				puts "=== SWAP==="
				puts "#{array[a]} is greater than #{array[b]}"
				puts array.inspect
				array.insert(a,array.delete_at(b))
				puts array.inspect
				a += 1
				b += 1
				break
			else #end of array
				puts "== END OF ARRAY == "
				puts "array[a] is #{array[a]} and array[b] is #{array[b]}"
				puts array.inspect
				a = 0
				b = 1
				break
			end
		end
			
		
		loop +=1
		puts "Looped #{loop} times"
		puts ""
		
		if loop > 99
			puts "Possible infinite loop at end of method"
			break
		end
	end
end

array = [4, 2, 5, 6, 3]

bubble_sort(array)