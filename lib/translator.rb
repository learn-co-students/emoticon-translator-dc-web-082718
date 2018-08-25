# require modules here

def load_library(file_path)
  # code goes here
  new_hash = Hash.new
  require "yaml"
  library = YAML.load_file(file_path)
  new_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  };

  library.each do |key, array|
    new_hash["get_emoticon"][array[0]] = array[1]
    new_hash["get_emoticon"][array[1]] = array[0]
    new_hash["get_meaning"][array[0]] = key
    new_hash["get_meaning"][array[1]] = key

  end
  puts new_hash["get_meaning"].keys
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  emoticon_hash = load_library(file_path)
  if emoticon_hash["get_emoticon"][emoticon] == nil
    return "Sorry, that emoticon was not found"
  end
  emoticon_hash["get_emoticon"][emoticon]
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  emoticon_hash = load_library(file_path)
  if emoticon_hash["get_meaning"][emoticon] == nil
    return "Sorry, that emoticon was not found"
  end
  emoticon_hash["get_meaning"][emoticon]
end
