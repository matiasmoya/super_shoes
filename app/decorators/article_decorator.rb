class ArticleDecorator
  attr_accessor :article

  def initialize(article)
    @article = article
  end

  def as_json
    {
      id: article.id,
      description: article.description,
      name: article.name,
      price: article.price,
      total_in_shelf: article.total_in_shelf,
      total_in_vault: article.total_in_vault,
      store_name: article.store.name
    }
  end

end