require 'rails_helper'

RSpec.describe Quote, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:favorites) }
    it { should have_many(:favorited_by) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:description) }
   
    it do
      should validate_length_of(:author).is_at_least(2).is_at_most(40)
    end
    it do
      should validate_length_of(:description).is_at_least(6).is_at_most(50_000)
    end
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