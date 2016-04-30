#For each element in the list, look at that element and the element
#directly to it's right. Swap these two elements based on the block
#passed into the method.

@a = 0
@b = 1

@looped = 0 

def bubble_sort (array)
	until (array.each_cons(2).all? {|a, b| yield <= 0}) == true do
		loop do
			case yield
			when -1 #don't swap
				@a += 1
				@b += 1
				#break
				puts -1
				puts array.inspect
			when 0 #don't swap
				@a += 1
				@b += 1
				#break
				puts 0
				puts array.inspect
			when 1 #swap
				array.insert(@a,array.delete_at(@b))
				@a += 1
				@b += 1
				puts 1
				puts array.inspect
				#break
			else #end of array
				@a = 0
				@b = 1
				puts "else"
				puts array.inspect
				#break
			end
			
			@looped += 1
			
			if @looped > 20
				return "Possible infinite loop detected"
			end
		end
	end
	puts array.inspect
end

#array = ["hello", "my", "name", "is", "daniel"]
#bubble_sort(array) {array[@a].length <=> array[@b].length}

#array = [4, 2, 5, 6, 3]
#bubble_sort(array) {array[@a] <=> array[@b]}