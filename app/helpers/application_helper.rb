module ApplicationHelper
  def default_stylesheet_include
    if File.exist?("#{Rails.root}/app/assets/stylesheets/precompile/#{controller_name}.css")
      stylesheet_link_tag "precompile/#{controller_name}"
    else
      stylesheet_link_tag "precompile/common"
    end
  end

  def default_javascript_include
    if File.exist?("#{Rails.root}/app/assets/javascripts/precompile/#{controller_name}.js")
      javascript_include_tag "precompile/#{controller_name}"
    else
      javascript_include_tag "precompile/common"
    end
  end

  def title(page_title, options={})
    content_for(:title, "#{page_title.to_s} | ")
    return content_tag(:h1, page_title, options)
  end

  def description(page_desc)
    content_for(:description, page_desc.to_s)
    return page_desc
  end
end
