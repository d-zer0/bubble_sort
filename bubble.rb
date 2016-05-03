def sorted?(arr)
  arr.each_cons(2).all? { |a, b| (a <=> b) <= 0 }
end

def bubble_sort (arr)
  a = 0
  b = 1
  until sorted?(arr) do
    # The yield call here passes `arr[a]` and `arr[b]` to the block.
    comparison = if block_given? 
               yield(arr[a], arr[b])
             else
               arr[a] <=> arr[b]
             end

    if [-1, 0, 1].include? comparison
      arr.insert(a, arr.delete_at(b)) if comparison == 1

      a += 1
      b += 1
    else
      a = 0
      b = 1
    end
  end

  arr
end

#sample_array = [4, 2, 5, 6, 3, 23, 5546, 234, 234, 6]
sample_array = ["Hello", "my", "name", "is", "Daniel"]

# Sanity check:
1.times do
  # `a` is the value of `arr[a]` in our function above. Likewise for `b` and `arr[b]`.
  print bubble_sort(sample_array.shuffle) { |a, b| a.length <=> b.length }, "\n"
end