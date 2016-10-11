require 'sinatra/base'

class ExampleApp < Sinatra::Base
  get "/" do
    "This is a sample application using the Sinatra framework on Ruby #{RUBY_VERSION}"
  end
end

