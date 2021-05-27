require 'rails_helper'

RSpec.describe FavoriteQuote, type: :model do
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

      @favorite_quote = @user.favorite_quotes.create!(quote_id: @quote.id)
    end

    it 'can be created by user' do
      expect(FavoriteQuote.first).to eq(@favorite_quote)
    end

    it 'can be accessed by the user' do
      expect(@user.favorite_quotes.first).to eq(@favorite_quote)
    end

    it 'can be accessed by the quote' do
      expect(@quote.favorite_quotes.first).to eq(@favorite_quote)
    end
  end
end
