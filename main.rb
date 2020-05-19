#!/usr/bin/ruby

require 'sinatra'
require 'haml'
require 'csv'
require './helper.rb'


# read article
def read_article(subdir, name)
    return File.read("#{ARTICLE}/#{subdir}/#{name}")
end

get '/' do

  @cnp = ls("#{ARTICLE}/cnp/")
  @operations = ls("#{ARTICLE}/operations/") + ls("#{DATAS}")
  @vmcores = ls("#{ARTICLE}/vmcores/")
  @memo = read_article("memo", "memo")


  haml :index
end

# copy and paste
get '/cnp/:name' do
  @name = params['name']
  content = "==========\n"
  paragraph = "----------\n"

  @ary = Array.new
  File.open("#{ARTICLE}/cnp/#{@name}"){|f|
    f.each_line(rs=content){|cont|
      tmp = Array.new
      cont.chomp(rs=content).each_line(rs=paragraph){|para|
        tmp.push(para.chomp(rs=paragraph))
      }
      @ary.push(tmp)
    }
  }
  haml :operations
end

# tools
get '/:name' do
  @name = params['name']
  if @name == "closedcase" then
    @csv = CSV.read("#{DATAS}/closedcase", headers: false)
    haml :closedcase
  else
    @internal = read_internal("operations", @name)
    haml :default
  end
end

get '/vmcores/:name' do
  @name = params['name']
  @article = read_article("vmcores", @name)

  haml :default
end
