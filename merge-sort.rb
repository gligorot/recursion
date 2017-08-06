#copied from other guys, not my creation

def merge_sort(ary)
  return ary if ary.length < 2

  left = ary[0..ary.length/2-1]
  right = ary[ary.length/2..ary.length]

  left = merge_sort(left)
  right = merge_sort(right)

  merge(left, right)
end

def merge(left, right)
  result = []

  until left.empty? || right.empty?
    if left.first < right.first
      result << left.first
      left.shift
    else
      result << right.first
      right.shift
    end
  end

  result << left unless left.length < 1
  result << right unless right.length < 1

  result.flatten
end

ary = [4,6,8,2,7,1,3,5]

print merge_sort(ary)
