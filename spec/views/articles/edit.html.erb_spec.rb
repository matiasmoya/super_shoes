require 'rails_helper'

RSpec.describe "articles/edit", type: :view do
  before(:each) do
    @article = assign(:article, Article.create!(
      :name => "MyString",
      :description => "MyString",
      :price => "MyString",
      :total_in_shelf => "MyString",
      :total_in_vault => "MyString",
      :store => nil
    ))
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(@article), "post" do

      assert_select "input#article_name[name=?]", "article[name]"

      assert_select "input#article_description[name=?]", "article[description]"

      assert_select "input#article_price[name=?]", "article[price]"

      assert_select "input#article_total_in_shelf[name=?]", "article[total_in_shelf]"

      assert_select "input#article_total_in_vault[name=?]", "article[total_in_vault]"

      assert_select "input#article_store_id[name=?]", "article[store_id]"
    end
  end
end
