class ArticlesDecorator
  attr_accessor :articles

  def initialize(articles)
    @articles = articles
  end

  def as_json
    {
      articles: build_articles,
      success: true,
      total_elements: articles.size
    }
  end

  def build_articles
    articles.inject([]) do |rtn, article|
      rtn << ArticleDecorator.new(article).as_json
    end
  end
end
