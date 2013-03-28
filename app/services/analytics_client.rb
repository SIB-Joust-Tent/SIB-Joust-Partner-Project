class AnalyticsClient
  attr_accessor :start_date, :end_date

  def initialize(start_date, end_date)
    @gattica = Gattica.new({:email => ENV['ANALYTICS_USER'], :password => ENV['ANALYTICS_PASSWORD']})
    @gattica.profile_id = @gattica.accounts.find{|a| a.title == "Pitchdeck"}.profile_id
    @start_date = start_date.blank? ? '2008-01-01' : Date.strptime(start_date, '%m/%d/%Y').to_s
    @end_date = end_date.blank? ? Date.today.to_s : Date.strptime(end_date, '%m/%d/%Y').to_s
  end

  def data
    data = @gattica.get({
      start_date: @start_date, 
      end_date: @end_date, 
      metrics: ['pageViews', 'uniquePageviews', 'avgTimeOnPage']
    })

    data_hash = {}
    data.points[0].metrics.each do |metric|
      data_hash = data_hash.merge(metric)
    end

    data_hash
  end
end