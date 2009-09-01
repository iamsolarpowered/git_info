require 'rubygems'
require 'sinatra'
require 'rack/test'
require 'spec'
require 'spec/interop/test'

set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

Test::Unit::TestCase.send :include, Rack::Test::Methods

def app
  Sinatra::Application
end
