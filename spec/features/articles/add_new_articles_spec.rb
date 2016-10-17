require "rails_helper"

feature "Admin creates articles" do
  let!(:store)  { create(:store) }

  context "admin goes to new articles page" do
    it "fills the form and creates an article associated to a store" do
      visit new_article_path

      expect(current_path).to eq("/articles/new")
      expect(page).to have_content("New Article")

      fill_in "article[name]", with: "New article"
      fill_in "article[description]", with: "Created with capybara"
      fill_in "article[price]", with: "15.50"
      fill_in "article[total_in_shelf]", with: "1"
      fill_in "article[total_in_vault]", with: "3"

      select store.name, from: "article[store_id]"
      
      expect {
        click_on "Create Article"  
      }.to change{ Article.count }.by 1
    end

    it "doesn't fills the form properly and the article is not created" do
      visit new_article_path

      fill_in "article[name]", with: "New article"
      
      expect {
        click_on "Create Article"  
      }.to change{ Article.count }.by 0

      expect(page).to have_content("Store can't be blank")
      expect(page).to have_content("Description can't be blank")
      expect(page).to have_content("Price can't be blank")
      expect(page).to have_content("Total in vault can't be blank")
    end
  end
end
