# Run by running "ruby app.rb"

require 'sinatra'
require 'fileutils'

filename = File.new("hello.txt", File::CREAT) # Create the file when the app starts.

# Show contents of our file.
get '/hello' do
  file = File.open(filename, "w+") # Open for read
  file.read
  file.close

  return 200
end

# Add more content
post '/hello' do
  file = File.open(filename, "w+") # Open for write. Rewrites the content of the file.
  file.write(params["name"])
  file.close

  return 200
end

# Edit the content
put '/hello' do
  file = File.open(filename, "a+") # Open for append. Adds content to the file.
  file.write(params["name"] + "\n")
  file.close

  return 200
end

# Delete file
delete '/hello' do
  FileUtils.rm("hello.txt") # Deletes the file.

  return 200
end

# COMMANDS:
# curl -XGET "http://localhost:4567/hello"
# curl -XPOST "http://localhost:4567/hello" -d "name"="fernando"
# curl -XPUT "http://localhost:4567/hello"  -d "name"="fernando"
# curl -XDELETE "http://localhost:4567/hello"
