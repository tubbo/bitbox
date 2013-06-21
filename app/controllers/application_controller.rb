class ApplicationController < ActionController::Base
  protect_from_forgery

  def redirect_non_json_requests
    redirect_to 'high_voltage/pages#show', id: 'index' \
      if params[:format] == 'html'
  end
end
