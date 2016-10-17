class ErrorsController < ApplicationController
  def bad_request
    if env["REQUEST_PATH"] =~ /^\/services/
      render json: ErrorsDecorator.new(400).as_json, status: 400
    else
      render text: "400 Not found", status: 400
    end
  end

  def not_authorized
    if env["REQUEST_PATH"] =~ /^\/services/
      render json: ErrorsDecorator.new(401).as_json, status: 401
    else
      render text: "401 Not authorized", status: 401
    end
  end

  def not_found
    if env["REQUEST_PATH"] =~ /^\/services/
      render json: ErrorsDecorator.new(404).as_json, status: 404
    else
      render text: "404 Not found", status: 404
    end
  end

  def exception
    if env["REQUEST_PATH"] =~ /^\/services/
      render json: ErrorsDecorator.new(500).as_json, status: 500
    else
      render text: "500 Internal Server Error", status: 500
    end
  end
end
