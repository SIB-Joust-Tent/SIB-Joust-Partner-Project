require 'open-uri'
class Angellist

  def co_info
    uri = URI.parse("https://api.angel.co/1/startups/127295")
    JSON.parse uri.open.read
  end

  def roles
    uri = URI.parse("https://api.angel.co/1/startups/127295/roles")
    JSON.parse uri.open.read
  end

	def comments
  	uri = URI.parse("https://api.angel.co/1/startups/127295/comments")
  	JSON.parse uri.open.read
	end

  def followers
    uri = URI.parse("https://api.angel.co/1/startups/127295/followers")
    JSON.parse uri.open.read
  end

  def jobs
    uri = URI.parse("https://api.angel.co/1/startups/127295/jobs")
    JSON.parse uri.open.read
  end

  def press
    uri = URI.parse("https://api.angel.co/1/press?startup_id=127295")
    JSON.parse uri.open.read
  end

end