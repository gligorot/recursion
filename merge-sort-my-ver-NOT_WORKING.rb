

#doesn't work, i needed to make a second method (merge) if i wanted it to work at all.... doing this with just one function is impossible...at least for me at my current level
def merge_sort(ary)
  if ary.size < 2
    return
  else
    #print ary
    puts
    left = ary[0...((ary.size/2.0).round)].map.to_a
    right = ary[((ary.size/2.0).round)..-1].map.to_a

    print left, right #ima kontakt i so edinecnite brojcinja, tuka treba da se sortiraat vo nov array

    merge_sort(left)
    merge_sort(right)


    left_index = 0
    right_index = 0
    sorted_index = 0

    sorted_ary = Array.new(left.size + right.size)

    sorted_left = []
    sorted_right = []

    #this is a pure mess, there were functions included in ruby to counter this but i didn';'t know them... (array.shift for example)

    while left_index <= left.size && right_index <= right.size
      puts
      puts print sorted_ary, "sorted_ary", left_index, right_index
      if left[left_index] == nil && right[right_index] == nil
        return #breaks if both are passed
      elsif left[left_index] == nil && right[right_index] != nil
        sorted_ary[sorted_index] = right[right_index]
        right_index += 1
        puts print sorted_ary, "sorted_ary", left_index, right_index
      elsif right[right_index] == nil && left[left_index] != nil
        sorted_ary[sorted_index] = left[left_index]
        left_index += 1
        puts print sorted_ary, "sorted_ary", left_index, right_index
      elsif left[left_index] < right[right_index]
        puts "left was smaller between #{left[left_index]} and #{right[right_index]}"
        sorted_ary[sorted_index] = left[left_index]
        left_index += 1
        puts print sorted_ary, "sorted_ary", left_index, right_index
      elsif right[right_index] < left[left_index]
        puts "right was smaller between #{left[left_index]} and #{right[right_index]}"
        sorted_ary[sorted_index] = right[right_index]
        right_index += 1
        puts print sorted_ary, "sorted_ary", left_index, right_index
      end
      sorted_index += 1

    end

    #merge_sort(sorted_ary)

    #sortiraj vnatre vo arrayite--ustvari mergesort na edinecnite arrai( L i D)
    #posle mergesort na leviot i desniot array
    #done
  end
end

ary = [4,6,8,2,7,1,3,5]

merge_sort(ary)

=begin

[4, 6, 8, 2, 7, 1, 3, 5]     1
[4, 6, 8, 2][7, 1, 3, 5]     2                                 
[4, 6][8, 2]                 3                                  
[4][6]                       4                                 
[8][2]                       4                                  
[7, 1][3, 5]                 3                                  
[7][1]                       4                                  
[3][5]                       4

[4, 6, 8, 2, 7][1, 3, 5, 9]  1                                
[4, 6, 8][2, 7]              2                                
[4, 6][8]                    3 / 4                               
[4][6]                       4                                
[2][7]                       4                                
[1, 3][5, 9]                 3                                
[1][3]                       4                                
[5][9]                       4                               
      
=end
