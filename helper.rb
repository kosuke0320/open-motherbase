#!/usr/bin/ruby

INTERNAL = "./internal/"
OPERATIONS = "#{INTERNAL}/operations/"
DATAS = "#{INTERNAL}/data/"


# ls(path) returns all file's name in 'path'
def ls(path)
  ary = Array.new
  Dir.chdir(path) {
#Dir.chdir~terminal=cd
    Dir.glob("*").each {|dir|
#すべてのファイルを取得
      ary.push(dir)
    }
  }
  return ary
end
