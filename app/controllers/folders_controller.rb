class FoldersController < ApplicationController
  respond_to :json
  before_filter :find_folder, except: [:index, :new, :create]

  # All folders.
  #
  # GET /
  def index
    @folders = Folder.where searchable_params

    respond_with @folders
  end

  def new
    @folder = Folder.new

    respond_with @folder
  end

  # Show a sync folder and all Entities inside it.
  #
  # GET /folders/:id
  def show
    respond_with @folder
  end

  # Create or track a new folder with Bitbox.
  #
  # POST /folders
  def create
    @folder = Folder.new creatable_params

    if @folder.save
      respond_with @folder
    else
      render 'error', status: 406, alert: @folder.error_msgs
    end
  end

  # Remove a folder from Sync. Does not destroy any file contents.
  #
  # DELETE /folders/1
  def destroy
    if @folder.destroy
      redirect_to folders_path
    else
      render 'error', status: 406, alert: @folder.error_msgs
    end
  end
private
  def creatable_params
    params.require(:folder).permit(:name, :secret)
  end

  def searchable_params
    params.permit(:name)
  end

  def find_folder
    @folder = Folder.find params[:id]
  rescue ActiveRecord::RecordNotFound
    render 'error', status: 404, alert: "Folder not found."
  end
end
