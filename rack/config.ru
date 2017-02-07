# Status => (code 200, 301, 500, 400)
# Headers => Meta data
# Body => Stuff that matters
require 'awesome_print'

class Application
  def call(env)
    ap(env)
    status = 200
    headers = { 'Content-Type' => 'text/html' }
    body = ['This is the first web application from RubyStars... from scratch!']

    [status, headers, body]
  end
end

run Application.new
