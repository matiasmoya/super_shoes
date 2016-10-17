class Services::BaseController < ApplicationController
  # http_basic_authenticate_with name: "my_user", password: "my_password"

  before_action :authenticate

  protected

  def authenticate
    auth || unauth
  end

  def auth
    authenticate_with_http_basic do |username, password|
      username == 'my_user' && password == 'my_password'
    end
  end

  def unauth
    self.headers['WWW-Authenticate'] = 'Basic realm="Clients"'
    respond_to do |format|
      format.json { render json: ErrorsDecorator.new(401).as_json, status: 401 }
    end
  end
end
