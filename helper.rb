#!/usr/bin/ruby

INTERNAL = "./internal/"
ARTICLE = "#{INTERNAL}/article/"
DATAS = "#{INTERNAL}/data/"
OPERATIONS = "#{INTERNAL}/operations/"

# ls(path) returns all file's name in 'path'
def ls(path)
  ary = Array.new
  Dir.chdir(path) {
    Dir.glob("*").each {|dir|
      ary.push(dir)
    }
  }
  return ary
end
