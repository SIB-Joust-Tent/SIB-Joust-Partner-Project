class CompaniesController < ApplicationController
  respond_to :html, :json

  def show
    @company = Company.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json
    end
  end

  def analytics
    respond_to do |format|
      format.html {}
      format.json do
        @company = Company.find(params[:id])
        analytics_client = AnalyticsClient.new(params[:start_date], params[:end_date], params[:account])
        respond_with analytics_client.data
      end
    end
  end

  def history
    respond_to do |format|
      format.html {}
      format.json {}
    end
  end

  def customers
    respond_to do |format|
      format.html {}
      format.json {}
    end
  end

  def market
    respond_to do |format|
      format.html {}
      format.json {}
    end
  end

  def competitors
    respond_to do |format|
      format.html {}
      format.json {}
    end
  end
end
