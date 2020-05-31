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
get '/cnp/cnp1/:name'do
@name = params['name']
@cnp = read_cnp("cnp1", @name)

haml :cnp

end

# cnp2
get '/cnp/cnp2/:name'do
@name = params['name']
@cnp = read_cnp("cnp2", @name)

haml :cnp

end

# operations
get '/:name' do
  @name = params['name']
  if @name == "closedcase" then
    @csv = CSV.read("#{DATAS}/closedcase", headers: false)
    haml :closedcase
  else
    @operations = read_operations("operations", @name)
    haml :default
  end
end

get '/vmcores/:name' do
  @name = params['name']
  @internal = read_internal("vmcores", @name)

  haml :default
end
