require 'open-uri'

class Trello::ApiController < ApplicationController
	respond_to :json

	def joust_board
		public_key = ENV['TRELLO_PUBLIC_KEY']
		token = ENV['TRELLO_TOKEN']

		# See https://trello.com/docs/api/index.html for more possible fields to add
		fields = "fields=name,desc"
		lists = "&lists=open&list_fields=name"
		cards = "&cards=visible&card_fields=idList,desc&card_attachments=true&card_attachment_fields=name,url"

		uri = URI.parse("https://api.trello.com/1/boards/511c01ca8f642cbd1c0053b5?#{fields}#{lists}#{cards}&key=#{public_key}&token=#{token}")
   
   	respond_with(JSON.parse uri.open.read)
	end

end
