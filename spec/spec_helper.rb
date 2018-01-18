# spec/spec_helper.rb
require File.join(File.dirname(__FILE__),'..', 'config', 'environment')
require 'rack/test'

ENV['RACK_ENV'] = 'test'


module RSpecMixin
  include Rack::Test::Methods
  def app 
  	MyApp
  end
end

# For RSpec 2.x and 3.x
RSpec.configure { |c| c.include RSpecMixin }
# If you use RSpec 1.x you should use this instead:
