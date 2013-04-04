class PagesController < ApplicationController
  layout nil
  
  def home
    redirect_to company_path(current_user.company) if user_signed_in? && current_user.company
  end
end