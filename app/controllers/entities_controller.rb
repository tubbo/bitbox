class EntitiesController < ApplicationController
  respond_to :json
  before_filter :authenticate_user!

  def index
    @entities = Entity.where(searchable_params).order(searchable_params)

    respond_with @entities
  end

  def new
    @entity = Entity.new
  end

  def show
    respond_with @entity
  end

  def create
    @entity = Entity.new creatable_params
  end

  def destroy
    message = if @entity.destroy
      { notice: "Deleted '#{@entity.name}''" }
    else
      { alert: "Error: Could not delete, #{@entity.error_messages}" }
    end

    redirect_to :index, message
  end

private
  def find_entity
    @entity = Entity.find params[:id]

    render 'errors/not_found', status: 404 and return \
      unless @entity.present?
  end

  def searchable_params
    params.permit(:name, :path, :size, :last_modified_on)
  end

  def creatable_params
    params.require(:entity).permit(:name, :path, :size, :last_modified_at)
  end
end
