# All URLs are hardcoded to Joust's profile
require 'open-uri'

class AngelListController < ApplicationController
	respond_to :json

  def company_info
  	uri = URI.parse("https://api.angel.co/1/startups/127295")
    respond_with(JSON.parse uri.open.read)
  end

  def roles
    uri = URI.parse("https://api.angel.co/1/startups/127295/roles")
    respond_with(JSON.parse uri.open.read)
  end

	def comments
  	uri = URI.parse("https://api.angel.co/1/startups/127295/comments")
  	respond_with(JSON.parse uri.open.read)
	end

  def followers
    uri = URI.parse("https://api.angel.co/1/startups/127295/followers")
    respond_with(JSON.parse uri.open.read)
  end

  def jobs
    uri = URI.parse("https://api.angel.co/1/startups/127295/jobs")
    respond_with(JSON.parse uri.open.read)
  end

  def press
    uri = URI.parse("https://api.angel.co/1/press?startup_id=127295")
    respond_with(JSON.parse uri.open.read)
  end
end
