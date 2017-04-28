require "json"
require "open-uri"
require "dotenv"
Dotenv.load
require "sendgrid-ruby"
include SendGrid

class Mail
	def initialize(story, recipient)
		@story = story
		@recipient = recipient
		@sg = SendGrid::API.new(api_key: ENV['SEND_GRID_KEY'])
	end
	def send
		puts "Sending a message to #{@recipient}"
		message = JSON.parse(%{{
			"personalizations": [
				{
					"to": [
						{
							"email": "timelyrandomness@gmail.com"
						}
					],
					"subject": "HELLO"
				}
			],
			"from": {
				"email": "#{@recipient}"
			},
			"content": [
				{
					"type": "text/html",
					"value": "HELLO I AM THE BEST"
				}
			]
		}})
		response = @sg.client.mail._("send").post(request_body: message)
		puts response.status_code
		puts "\n-----------\n"
		puts response.body
		puts "\n-----------\n"
		puts response.headers
	end
	def verify
		
	end
end
