require 'open-uri'

class Trello::ApiController < ApplicationController
respond_to :json

# def joust_board
#		joust = Trello::Board.find('sales-funnel')
#		joust.boards
#	end

	def joust_board
		#uri = URI.parse("https://api.trello.com/1/boards/511c01ca8f642cbd1c0053b5?lists=open&list_fields=name&fields=name,desc&key=c309e3a530528d761cb3985a974af3b5&token=ce29fe4fa36b60fd420394db724df53c0b8d9c7d1b53983b24a89931b866f0c7")
		#uri = URI.parse("https://api.trello.com/1/members/samanthascharr1/boards?key=c309e3a530528d761cb3985a974af3b5&token=14264deaa21f00523e07b36f6b935eb2a33f4a821955c5383d29b907c7e1975c")

		uri = URI.parse("https://api.trello.com/1/boards/511c01ca8f642cbd1c0053b5?lists=open&list_fields=name&fields=name,desc&cards=all&card_attachments=true&key=c309e3a530528d761cb3985a974af3b5&token=14264deaa21f00523e07b36f6b935eb2a33f4a821955c5383d29b907c7e1975c")
   
   	respond_with(JSON.parse uri.open.read)
	end

end
