class HomeController < ApplicationController
  before_action :authenticate_user!
  respond_to :json, :html
  def index
      respond_with current_user.as_json
  end


end
