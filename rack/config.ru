# Status => (code 200, 301, 500, 400)
# Headers => Meta data
# Body => Stuff that matters
require 'awesome_print'

class Application
  def call(env)
    handle_request(env['REQUEST_METHOD'],
                   env['PATH_INFO'],
                   env['rack.input'])
  end

  private

  def handle_request(method, path, rack_input)
    case method
    when 'GET'
      get(path)
    # when 'POST'
    #   post(...)
    else
      ap(rack_input)
      method_not_allowed(method)
    end
  end

  def get(path)
    status = 200
    headers = { 'Content-Type' => 'text/html' }
    body = ["You requested #{path} using GET"]
    [status, headers, body]
  end

  def method_not_allowed(method)
    status = 405
    headers = {}
    body = ["Method not allowed! #{method}"]
    [status, headers, body]
  end
end

run Application.new
