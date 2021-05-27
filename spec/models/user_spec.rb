require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:quotes) }
    it { should have_many(:favorites) }
    it { should have_many(:favorite_quotes) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:nickname) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to allow_value('email@addresse.foo').for(:email) }
    it { is_expected.to_not allow_value('foo').for(:email) }
  end

  describe 'scopes' do
    before :each do
      @user = User.create!(name: 'Gandhi', email: 'gandhi@gmail.com', password: '12345678', nickname: 'Mahatma')
    end

    it 'can be created and accesed' do
      expect(User.first).to eq(@user)
    end
  end
end
