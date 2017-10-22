class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def after_sign_in_path_for(_resource)
    session[:user_return_to] || root_path
  end
  # def default_url_options
  # if Rails.env.production?
  #   { :host => "example.com"}
  # else
  #   {:host => "example1.com"}
  # end
# end
  private
    def current_resource_owner
      User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end
end
