class FoldersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_folder, only: [:update]

  def create
  	@folder = current_user.folders.new(folder_params)

  	if @folder.save
  		redirect_to '/home'
  	end
  end

  def update
    if @folder.update(folder_params)
      redirect_to '/home'
    end
  end

  private
   
  # Use callbacks to share common setup or constraints between actions.
  def set_folder
    @folder = Folder.find(params[:id])
  end

  def folder_params
    params.require(:folder).permit(:name, :user_id, :parent_id, files: [])
  end
end
