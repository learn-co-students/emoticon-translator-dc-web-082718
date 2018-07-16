require 'yaml'
require 'pry'

def load_library path
  h_emoticons = YAML.load_file(path)
  h_translation = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }

  h_emoticons.each { | meaning, a_emoticon_pair |
    h_translation["get_meaning"][a_emoticon_pair[1]] = meaning
    h_translation["get_emoticon"][a_emoticon_pair[0]] = a_emoticon_pair[1]
  }

h_translation
end

def get_japanese_emoticon (path, eng_emoticon)
  h_library = load_library(path)
  # binding.pry
  japanese_emoticon = h_library["get_emoticon"][eng_emoticon]

  if !japanese_emoticon then return "Sorry, that emoticon was not found"
  else return japanese_emoticon end
end

def get_english_meaning (path, jpn_emoticon)
  h_library = load_library(path)
  # binding.pry
  english_meaning = h_library["get_meaning"][jpn_emoticon]

  if !english_meaning then return "Sorry, that emoticon was not found"
  else return english_meaning end
end
