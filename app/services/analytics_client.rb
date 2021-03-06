class AnalyticsClient
  attr_accessor :start_date, :end_date

  def initialize(start_date, end_date, account)
    @gattica = Gattica.new({:email => ENV['ANALYTICS_USER'], :password => ENV['ANALYTICS_PASSWORD']})
    @gattica.profile_id = @gattica.accounts.find{|a| a.title == account}.profile_id
    @start_date = start_date
    @end_date = end_date
  end

  def data
    # 'entranceBounceRate', 'visitBounceRate'
    data = @gattica.get({
      start_date: @start_date, 
      end_date: @end_date, 
      dimensions: ['month', 'year'], 
      metrics: ['visits', 'bounces', 'newVisits', 'pageViews', 'uniquePageviews', 'avgTimeOnPage', 'visitors', 'avgTimeOnSite'], 
      sort: ['year']
    })
    labels = []
    data_points = []
    
    data.to_h['points'].each do |point|
      point_hash = point.to_h
      month = Date::MONTHNAMES[point_hash["dimensions"][0][:month].to_i][0...3]
      labels << "#{month} #{point_hash["dimensions"][1][:year][2..4]}"
      data_hash = {}
      point_hash["metrics"].each do |m| data_hash[m.keys[0]] = m.values[0] end
      data_points << data_hash
    end

    { labels: labels, data: data_points }
  end
end