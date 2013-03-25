class ApplicationController < ActionController::Base
  protect_from_forgery


  def followers
    @company = Company.find(params[:id])
    content = open("https://api.angel.co/1/startups/127295/followers").read
  end

  def jobs
    @company = Company.find(params[:id])
    content = open("https://api.angel.co/1/startups/127295/jobs").read
  end 

  def press
    @company = Company.find(params[:id])
    content = open("https://api.angel.co/1/press?startup_id=127295").read
  end 

  def co_info
    @company = Company.find(params[:id])
    content = open("https://api.angel.co/1/startups/127295").read
  end

  def roles
    @company = Company.find(params[:id])
    content = open("https://api.angel.co/1/startups/127295/roles").read
  end

  def comments
    @company = Company.find(params[:id])
    content = open("https://api.angel.co/1/startups/127295/comments").read
  end
  
end
