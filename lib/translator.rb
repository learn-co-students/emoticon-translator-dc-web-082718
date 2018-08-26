# require modules here
require 'yaml'
require 'pry'

  def load_library(file_path)
  library = YAML.load_file(file_path)
  result = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do |meaning, emoticons|
    result["get_meaning"][emoticons[1]] = meaning
    result["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  result
end

def get_japanese_emoticon(emoticon_file, emoticon)
  emoticon_lib = load_library(emoticon_file)
  japanese_emoticon = emoticon_lib['get_emoticon'][emoticon]
  japanese_emoticon ? japanese_emoticon : 'Sorry, that emoticon was not found'
end
  # code goes here


def get_english_meaning(emoticon_file, emoticon)
    emoticon_lib = load_library(emoticon_file)
    english_meaning = emoticon_lib['get_meaning'][emoticon]
    english_meaning ? english_meaning : 'Sorry, that emoticon was not found'
  end
