def swap(arr, idx)
	raise IndexError.new("Index #{idx} is out of bounds") if idx >= arr.length || idx < 0

	temp 			= arr[idx]
	arr[idx] 		= arr[idx + 1]
	arr [idx + 1] 	= temp
end

def bubble_sort(arr)
	loop do 
		sorted_elements = 0

		arr.each_cons(2).each_with_index do |pair, idx|
			comparison = if block_given?
				yield pair.first, pair.last
			else
				pair.first <=> pair.last
			end

			if comparison > 0
				swap(arr, idx)
			else
				sorted_elements += 1
			end
		end

		return arr if sorted_elements >= arr.length - 1
	end
end

sample_array     = [4, 2, 2, 2, 2, 2, 5, 5, 6, 3, 23, 5546, 234, 234, 6]
sample_str_array = ["a", "ccc", "ccccc"]

5.times do
	print bubble_sort(sample_array.shuffle) { |a, b| a <=> b }, "\n"
	print bubble_sort(sample_str_array.shuffle) { |a, b| a.length <=> b.length}, "\n"
end