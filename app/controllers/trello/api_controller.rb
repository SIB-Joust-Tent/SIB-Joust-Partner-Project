require 'open-uri'

class Trello::ApiController < ApplicationController
	respond_to :json

	def joust_board
		public_key = ENV['TRELLO_PUBLIC_KEY']
		token = ENV['TRELLO_TOKEN']

		# See https://trello.com/docs/api/index.html for more possible fields to add
		lists = "fields=name&lists=open&list_fields=name"
		cards = "&cards=visible&card_fields=idList,name,desc"

		hash = JSON.parse(URI.parse("https://api.trello.com/1/boards/511c01ca8f642cbd1c0053b5?#{lists}#{cards}&key=#{public_key}&token=#{token}").open.read)
		# Delete lists not configured to display
		hash["lists"].delete_if{|l| !current_user.company.displayed_trello_lists.include?(l["id"])}
		respond_with(hash)
	end

	def joust_activity
		public_key = ENV['TRELLO_PUBLIC_KEY']
		token = ENV['TRELLO_TOKEN']

		# See https://trello.com/docs/api/index.html for more possible fields to add
		lists = "fields=name&lists=open&list_fields=name"
		actions = "&actions=updateCard,createCard&action_fields=data,type,date"

		hash = JSON.parse(URI.parse("https://api.trello.com/1/boards/511c01ca8f642cbd1c0053b5?#{lists}#{actions}&key=#{public_key}&token=#{token}").open.read)
		trello_event_array = []
		hash["actions"].each do |event|
			if event["type"] == "createCard"
				trello_event_array.push(TrelloEvent.new(event["data"]["card"]["id"], event["type"], event["data"]["list"]["id"], event["date"]))
			end
			if event["type"] == "updateCard" and event["data"].has_key?("listAfter")
				trello_event_array.push(TrelloEvent.new(event["data"]["card"]["id"], event["type"], event["data"]["listAfter"]["id"], event["date"]))
			end
		end
		respond_with(trello_event_array)
	end
end
