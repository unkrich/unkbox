class ActiveStorage::BaseController < ActionController::Base
  before_action :authenticate_user!
  include ActiveStorage::SetCurrent

  protect_from_forgery with: :exception
end