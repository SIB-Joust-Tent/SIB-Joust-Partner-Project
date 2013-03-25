class AngelListController < ApplicationController
	def index
    @angellist = Angellist.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @angellist }
    end
  end
end
