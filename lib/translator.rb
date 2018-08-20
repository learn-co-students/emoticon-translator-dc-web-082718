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
  binding.pry
=begin
{"get_emoticon"=>
  {"O:)"=>"☜(⌒▽⌒)☞",
   ">:("=>"ヽ(ｏ`皿′ｏ)ﾉ"} etc etc
 {"get_meaning"=>
     {"☜(⌒▽⌒)☞"=>"angel",
      "ヽ(ｏ`皿′ｏ)ﾉ"=>"angry"} etc etc
=end
end

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end
