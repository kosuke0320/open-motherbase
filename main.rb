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
  @tools = ls("#{ARTICLE}/tools/") + ls("#{DATAS}")
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
  haml :tools
end

# tools
get '/:name' do
  @name = params['name']
  if @name == "closedcase" then
    @csv = CSV.read("#{DATAS}/closedcase", headers: false)
    haml :closedcase
  else
    @article = read_article("tools", @name)
    haml :default
  end
end

get '/vmcores/:name' do
  @name = params['name']
  @article = read_article("vmcores", @name)
  
  haml :default
end
