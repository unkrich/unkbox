class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:home]

  def landing
  	if user_signed_in?
  		redirect_to '/home'
  	end
  end

  def home
    ActiveStorage::Current.host = "localhost:3000"
    
    if params[:path] # '/home/*'
      parameters = params[:path].split("/").reverse
      @subfolder_parent, @folders = verify_path(parameters)
    else # '/home'
      @subfolder_parent = current_user.home
      @folders = Folder.roots(current_user)
    end

    @files = @subfolder_parent.files if @subfolder_parent
    @files = [] if !@files

    # To create a new folder in the directory
  	@new_folder = current_user.folders.new

  end

  private

  def verify_path(parameters)
      temp_folder = current_user.folders.find_by_name(parameters.first)
      parent = temp_folder
      folders = temp_folder.children if temp_folder

      # Trace path
      for param in parameters[1..parameters.count]
        if temp_folder.parent and temp_folder.parent.name == param
          temp_folder = temp_folder.parent
        else
          flash[:error] = "Folder path not found."
          redirect_to '/home'
        end
      end

      # Check if last folder in path is root folder - as should be
      if temp_folder == nil || temp_folder.parent != current_user.home
        flash[:error] = "Folder path not found."
        redirect_to '/home'
      end

      return parent, folders.order("name ASC")
  end
end
