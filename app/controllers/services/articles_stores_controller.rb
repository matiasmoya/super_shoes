class Services::ArticlesStoresController < Services::BaseController
  before_action :set_store, only: [:show]

  def show
    if @store
      render json: ArticlesDecorator.new(@store.articles).as_json, status: 200
    else
      handle_errors
    end
  end

protected
  def set_store
    @store = Store.where(id: params[:id]).first
  end

  def handle_errors
    Integer(params[:id]) rescue 
      return render json: { "error_msg": "Bad Request","error_code": 400, "success": false }, status: 400


    unless @store
      return render json: {"error_msg": "Record not Found", "error_code": 404, "success": false}, status: 404 
    end
  end
end

