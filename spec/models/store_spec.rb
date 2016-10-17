require 'rails_helper'

RSpec.describe Store, type: :model do
  let!(:store) { create(:store) }

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
  end

  describe "Factory" do
    it "creates a valid store" do
      expect(store).to be_valid
    end
  end
end
