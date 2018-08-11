require 'yaml'
require 'pry'

def load_library(file_path)
  library = {"get_meaning" => {}, "get_emoticon" => {}}

  YAML.load_file(file_path).each do |meaning, array|
    english = array[0]
    japanese = array[1]
    library["get_emoticon"][english] = japanese
    library["get_meaning"][japanese] = meaning
  end
  library
end



def get_japanese_emoticon (file_path, emoticon)
  library = load_library(file_path)
  if library["get_emoticon"].include?(emoticon)
    answer = library["get_emoticon"][emoticon]
  elsif library["get_emoticon"].include?(emoticon) == false
    answer = "Sorry, that emoticon was not found"
  end
  answer
end



def get_english_meaning (file_path, emoticon)
  library = load_library(file_path)

  if library["get_meaning"].include?(emoticon)
    answer = library["get_meaning"][emoticon]
  else
    answer = "Sorry, that emoticon was not found"
  end
  answer
end
