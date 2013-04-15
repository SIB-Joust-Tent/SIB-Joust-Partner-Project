SIBJoustPartnerProject::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.serve_static_assets = true
  config.static_cache_control = "public, max-age=2592000"

  config.assets.precompile += Dir["#{Rails.root}/app/assets/javascripts/precompile/*.js"].map{|s| s.gsub("#{Rails.root}/app/assets/javascripts/", "")}
  config.assets.precompile += Dir["#{Rails.root}/app/assets/stylesheets/precompile/*.css.scss"].map{|s| s.gsub("#{Rails.root}/app/assets/stylesheets/", "").gsub(".scss", "")}
  config.assets.compress = true
  config.assets.compile = true
  config.assets.digest = true

  config.action_controller.asset_host = "//#{ENV['FOG_DIRECTORY']}.s3.amazonaws.com"

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify
end
