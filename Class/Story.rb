require "babbler"
require "open-uri"
require "nokogiri"

class Story
	def initialize()
		@babble = Babbler.babble
		@link = "https://mobile.nytimes.com/search?query=#{@babble}&sort=rel&action=click&contentCollection&region=TopBar&WT.nav=searchWidget&module=SearchSubmit&pgtype=Homepage"
		url = URI.parse(URI.encode(link.strip))
		@doc = Nokogiri::HTML(open(@url))
		puts "Selected words are #{@babble} \nlink is: #{url}"
	end
	def result
		@doc.css(".highlighted").each do |element|
			return element
		end
	end
	def babbler
		return @babble
	end
	def link
		return @link
	end
	def title
		link = @doc.css(".highlighted").css(".title") 
		return link
	end
	def summary
		link = @doc.css(".highlighted").xpath("//a/p")
		return link
	end
	def info
		link = @doc.css(".highlighted").css(".search-item-details").xpath("//span")
		return link
	end
end