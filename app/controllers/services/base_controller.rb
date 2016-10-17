class Services::BaseController < ApplicationController
  http_basic_authenticate_with name: "my_user", password: "my_password"
end
