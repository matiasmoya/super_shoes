require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:article) { create(:article) }

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:total_in_shelf) }
    it { should validate_presence_of(:total_in_vault) }
    it { should validate_presence_of(:store) }
  end

  describe "Factory" do
    it "creates a valid article" do
      expect(article).to be_valid
    end
  end
end
