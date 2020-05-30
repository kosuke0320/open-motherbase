#!/usr/bin/ruby

require './main.rb'
require 'minitest/autorun'
require 'rack/test'
require './helper.rb'

class MyTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_response
    # index
    get '/'
    assert last_response.ok?

    operations = ls("#{INTERNAL}/operations/") + ls("#{DATAS}")
    operations.each {|x|
      get "/#{x}"
      assert last_response.ok?
    }

    cnp = ls("#{INTERNAL}/cnp/")
    cnp.each {|x|
      get "/cnp/#{x}"
      assert last_response.ok?
    }

    vmcores = ls("#{ARTICLE}/vmcores/")
    vmcores.each {|x|
      get "/vmcores/#{x}"
      assert last_response.ok?
    }
  end

end
