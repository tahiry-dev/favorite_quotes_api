require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:quote) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:quote_id) }
  end

  describe 'scopes' do
    before :each do
      @user = FactoryBot.create(:user)
      @quote = @user.quotes.create!(author: 'Example', description: 'Example desx')
    end

    it 'can be created by user' do
      expect(Quote.first).to eq(@quote)
    end

    it 'can be accessed by the author' do
      expect(@user.quotes.first).to eq(@quote)
    end
  end
end
