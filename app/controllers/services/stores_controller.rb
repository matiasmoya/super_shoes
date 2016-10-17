class Services::StoresController < Services::BaseController
  def index
    render json: StoresDecorator.new(Store.all).as_json, status: 200
  end
end
