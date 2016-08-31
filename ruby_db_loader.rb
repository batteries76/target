require 'pry'
require 'mongo'
require 'json'

nine_file_contents = File.read('nine_letter_word_file')
file_arr = nine_file_contents.split("\n")

client = Mongo::Client.new('mongodb://db_load:db_load@ds019906.mlab.com:19906/target_words')
db = client.database

collection = client[:words]
collection.drop

def ascii_arr_create arr

  ascii_diff = 97
  alpha_arr = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

  arr.each do |letter|
    index = letter.ord - ascii_diff
    alpha_arr[index] += 1
#binding.pry
  end
#binding.pry
  return alpha_arr
end

def check_solution(nine_arr, dict_arr)

  index = 0
#binding.pry
  26.times do
    if nine_arr[index] < dict_arr[index]
      return 0
    end
    index += 1
  end

  return 1
end

file_arr.each do |nine_word|
#1.times do

  puts("first loop")

  nine_word_arr = nine_word.split('')
#  nine_word_arr = "aardvarks".split('')

  dict_file_contents = File.read('stripped_word_file')
  dict_arr = dict_file_contents.split("\n")

  flag = 0

  @solution_arr = []

  dict_arr.each do |dict_word|

    puts("second loop")
    puts dict_word
    dict_word_arr = dict_word.split('')

    dict_word_ascii = ascii_arr_create(dict_word_arr)
    nine_word_ascii = ascii_arr_create(nine_word_arr)

    solution = check_solution(nine_word_ascii, dict_word_ascii)

    if solution == 1
      @solution_arr.push(dict_word)
    end

  end

  soln_num = @solution_arr.length

  word_hash = { nine_word: nine_word, solutions: @solution_arr, solution_num: soln_num }

  collection = client[:words]

  result = collection.insert_one(word_hash)
  result.n
#binding.pry
end

# nine_file_contents.close
# dict_file_contents.close

# collection_nine = client[:niners]
#
# result = collection_nine.insert_many(word_arr)

#binding.pry
