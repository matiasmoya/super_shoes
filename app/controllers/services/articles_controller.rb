class Services::ArticlesController < Services::BaseController
  def index
    render json: ArticlesDecorator.new(Article.all).as_json, status: 200
  end
end
