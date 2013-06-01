class EntitiesController < ApplicationController
  respond_to :json
  before_filter :authenticate_user!
  before_filter :find_entity, only: [:show, :destroy]

  def index
    @entities = Entity.where searchable_params
                      .order by_what_was_searched

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
    params.permit(:name, :size, :last_modified_on)
  end

  def by_what_was_searched
    searchable_params.keys.reduce { |query,param|
      query += "#{param} "
    }.strip
  end

  def creatable_params
    params.require(:entity).permit(:name, :size, :last_modified_at)
  end
end
