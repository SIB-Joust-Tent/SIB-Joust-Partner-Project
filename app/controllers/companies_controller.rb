class CompaniesController < ApplicationController
  respond_to :html, :json

  def index
    @companies = Company.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  def show
    @company = Company.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @company }
    end
  end

  def analytics
    respond_to do |format|
      format.json do
        @company = Company.find(params[:id])
        ga = Gattica.new({:email => ENV['ANALYTICS_USER'], :password => ENV['ANALYTICS_PASSWORD']})
        ga.profile_id = ga.accounts.find{|a| a.title == "Pitchdeck"}.profile_id
        start_date = params[:start_date].blank? ? '2008-01-01' : Date.strptime(params[:start_date], '%m/%d/%Y').to_s
        end_date = params[:end_date].blank? ? Date.today.to_s : Date.strptime(params[:end_date], '%m/%d/%Y').to_s
        data = ga.get({
          :start_date => start_date, 
          :end_date => end_date, 
          :metrics => ['pageViews', 'uniquePageviews', 'avgTimeOnPage']
        })
        binding.pry
        # Jamie: Here. Data is: [{:pageviews=>93.0}, {:uniquePageviews=>51.0}, {:avgTimeOnPage=>231.375}]
        respond_with data.points[0].metrics
      end
    end
  end

  def new
    @company = Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @company }
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.new(params[:company])

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    redirect_to companies_url
  end
end
