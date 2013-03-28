require 'open-uri'

class Trello::ApiController < ApplicationController
respond_to :json

# def joust_board
#		joust = Trello::Board.find('sales-funnel')
#		joust.boards
#	end
	def joust_board
		fields = "fields=name,desc&"
		lists = "lists=open&list_fields=name"
		cards = "&cards=visible&card_fields=idList,desc&card_attachments=true&card_attachment_fields=name,url"

		uri = URI.parse("https://api.trello.com/1/boards/511c01ca8f642cbd1c0053b5?#{fields}#{lists}#{cards}&key=c309e3a530528d761cb3985a974af3b5&token=14264deaa21f00523e07b36f6b935eb2a33f4a821955c5383d29b907c7e1975c")
   
   	respond_with(JSON.parse uri.open.read)
	end

end
