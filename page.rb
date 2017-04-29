require "erb"
require "sinatra"

get "/" do
	erb :index
end

get "/test" do
	newstory = Story.new
	@story = newstory
	erb :test
end