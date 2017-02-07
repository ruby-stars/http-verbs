# First run "bundle install" (remember to "gem install bundler" before).
# Then run by running "ruby app.rb"

require 'sinatra'
require 'fileutils'

FILENAME = "hello.txt"

# Show contents of our file.
get '/hello' do
  # a w r
  file = File.open(FILENAME, "r") # Open for read
  value = file.read
  file.close
  value
end

# Add more content
post '/hello' do
  file = File.open(FILENAME, "w+") # Open for write. Rewrites the content of the file.
  file.write(params["name"])
  file.close

  return 200
end

# Edit the content
put '/hello' do
  # old_name => new_name
  old_name = params['old_name']
  new_name = params['new_name']

  file = File.open(FILENAME, "r") # Open for append. Adds content to the file.
  contents = file.read
  new_contents = contents.gsub(old_name, new_name)
  file.close

  file = File.open(FILENAME, "w")
  file.write(new_contents)
  file.close
  return 200
end

# Delete file
delete '/hello' do
  old_name = params['name']
  file = File.open(FILENAME, "r") # Open for append. Adds content to the file.
  contents = file.read
  new_contents = contents.gsub(old_name, '')
  file.close

  file = File.open(FILENAME, "w")
  file.write(new_contents)
  file.close

  return 200
end

# COMMANDS:
# curl -XGET "http://localhost:4567/hello"
# curl -XPOST "http://localhost:4567/hello" -d "name"="fernando"
# curl -XPUT "http://localhost:4567/hello"  -d "name"="fernando"
# curl -XDELETE "http://localhost:4567/hello"
