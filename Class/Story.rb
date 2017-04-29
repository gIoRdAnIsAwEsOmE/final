require "babbler"
require "open-uri"
require "nokogiri"

class Story
	def initialize
		@babble = Babbler.babble
		@link = "https://mobile.nytimes.com/search?query=#{@babble}&sort=rel&action=click&contentCollection&region=TopBar&WT.nav=searchWidget&module=SearchSubmit&pgtype=Homepage"
		url = URI.parse(URI.encode(link.strip))
		@doc = Nokogiri::HTML(open(url))
		puts "Selected words are #{@babble} \nlink is: #{url}"
	end
	def result
		return @doc.css(".headlines").css(".highlighted")
	end
	def babble
		@babble
	end
	def link
		@link
	end
	def title
		return result.css(".title") 
	end
	def summary
		return result.xpath("//a/p")
	end
	def info
		return result.css(".highlighted").css(".search-item-details")[0]
	end
end