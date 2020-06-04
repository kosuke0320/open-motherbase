#!/usr/bin/ruby

require 'sinatra'
require 'haml'
require 'csv'
require './helper.rb'


# read internal
def read_internal(subdir, name)
    return File.read("#{INTERNAL}/#{subdir}/#{name}")
end

get '/' do

  @cnp = ls("#{INTERNAL}/cnp/")
  @operations = ls("#{INTERNAL}/operations/") + ls("#{DATAS}")
  @vmcores = ls("#{INTERNAL}/vmcores/")
  @memo = read_internal("memo", "memo")


  haml :index
end

# cnp1
get '/cnp1/:name' do
  @name = "cnp1/#{params['name']}"
    @internal = read_internal("cnp", @name)
    haml :cnp
  end

# cnp2
get '/cnp2/:name' do
  @name = "cnp2/#{params['name']}"
    @internal = read_internal("cnp", @name)
    haml :cnp
  end

# operations
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
  @internal = read_internal("vmcores", @name)

  haml :default
end
