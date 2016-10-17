require 'rails_helper'

RSpec.describe "articles/show", type: :view do
  before(:each) do
    @article = assign(:article, Article.create!(
      :name => "Name",
      :description => "Description",
      :price => "Price",
      :total_in_shelf => "Total In Shelf",
      :total_in_vault => "Total In Vault",
      :store => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Price/)
    expect(rendered).to match(/Total In Shelf/)
    expect(rendered).to match(/Total In Vault/)
    expect(rendered).to match(//)
  end
end
