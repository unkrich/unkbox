class FoldersController < ApplicationController
  before_action :authenticate_user!

  def create
  	@folder = current_user.folders.new(folder_params)

  	if @folder.save
  		redirect_to '/home'
  	end
  end

  private

  def folder_params
    params.require(:folder).permit(:name, :user_id, :parent_id)
  end
end
