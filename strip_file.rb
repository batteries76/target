require 'pry'

#file = File.read('british-english')
file_contents = File.read('british-english')
file2 = File.open('nine_letter_word_file', 'w')
file3 = File.open('stripped_word_file', 'w')

def letter?(char)
  if char.ord >=97 && char.ord <= 123
    return true
  else
    return false
  end
end

fname = "sample.txt"
somefile = File.open(fname, "w")
somefile.puts "Hello file!"
somefile.close

file_contents.each_line do |line|
#  puts line
#  puts line.length
  line_arr = line.split('')
  line_arr.pop
  if line == line.downcase
#    puts line_arr
#    puts line_arr.length
    flag = 1
    line_arr.each do |char|
      if letter?(char) == false
        flag = 0
      end
    end
    if flag == 1
      if line_arr.length == 9
#        puts 'nine letter!'
        puts line
        file2.write(line)
#        file2.puts("printed!")
      end
#        puts 'other valid words'
      if line_arr.length >= 4
        puts(line)
        file3.puts line
      end

    end
  end
end

#file2.puts "printed! end!"

file2.close
file3.close

binding.pry
