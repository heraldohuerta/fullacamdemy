arr = Array.new
arr2 = Array.new
arr = [1,2,3]
arr.map { |e| arr2 << e if e % 2 == 0 }
print arr2
