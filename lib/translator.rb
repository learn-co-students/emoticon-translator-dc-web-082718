require "yaml"


def load_library(file)
  emoticons = YAML.load_file("#{file}")
  return_hash = {
    "get_emoticon" => {},
    "get_meaning" => {}
  }
  
  emoticons.each do |meaning, array|
    return_hash["get_meaning"][array[1]] = meaning
    return_hash["get_emoticon"][array[0]] = array[1]
  end
  
  return_hash
end

def get_japanese_emoticon(file, english_emoticon)
  emoticons = load_library(file)
  if emoticons["get_emoticon"].key?(english_emoticon)
    emoticons["get_emoticon"][english_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, japanese_emoticon)
  emoticons = load_library(file)
  if emoticons["get_meaning"].key?(japanese_emoticon)
    emoticons["get_meaning"][japanese_emoticon]
  else 
    return "Sorry, that emoticon was not found"
  end
end