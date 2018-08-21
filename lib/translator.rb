# require modules here
require 'yaml'
require 'pry'

def load_library(path)
  emoticons = YAML.load_file(path) #works

  lib_hash = {
    "get_emoticon" => {},
    "get_meaning" => {}
  }

  emoticons.each do |meaning, symbols|
    lib_hash["get_meaning"][symbols[1]] = meaning
    lib_hash["get_emoticon"][symbols[0]] = symbols[1]
  end

  lib_hash

=begin
{"get_emoticon"=>
  {"O:)"=>"☜(⌒▽⌒)☞",
   ">:("=>"ヽ(ｏ`皿′ｏ)ﾉ"} etc etc
 {"get_meaning"=>
     {"☜(⌒▽⌒)☞"=>"angel",
      "ヽ(ｏ`皿′ｏ)ﾉ"=>"angry"} etc etc
=end
end

def get_japanese_emoticon(path, eng_emoticon)
  emoticons = load_library(path)

  if emoticons["get_emoticon"].key?(eng_emoticon)
    emoticons["get_emoticon"][eng_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, jpn_emoticon)
  emoticons = load_library(path)

  if emoticons["get_meaning"].key?(jpn_emoticon)
    emoticons["get_meaning"][jpn_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
