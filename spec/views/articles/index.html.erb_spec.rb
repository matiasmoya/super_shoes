require 'rails_helper'

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        :name => "Name",
        :description => "Description",
        :price => "Price",
        :total_in_shelf => "Total In Shelf",
        :total_in_vault => "Total In Vault",
        :store => nil
      ),
      Article.create!(
        :name => "Name",
        :description => "Description",
        :price => "Price",
        :total_in_shelf => "Total In Shelf",
        :total_in_vault => "Total In Vault",
        :store => nil
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Price".to_s, :count => 2
    assert_select "tr>td", :text => "Total In Shelf".to_s, :count => 2
    assert_select "tr>td", :text => "Total In Vault".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
