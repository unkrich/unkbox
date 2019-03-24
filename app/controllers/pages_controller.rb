class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:home]


  def landing
  	if user_signed_in?
  		redirect_to '/home'
  	end
  end

  def home
  	@folders = current_user.folders.where(parent: nil)
  end
end
