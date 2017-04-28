require "erb"

require "sinatra"

get "/" do
	erb :index
end

get "/test" do
	newstory = Story.new
	erb :test, :locals => {terms => params[newstory.babbler], title => params[newstory.title.first], summary => params[newstory.summary.first], info => params[newstory.info.first], link => params[newstory.link]}
end