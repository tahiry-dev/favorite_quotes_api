require 'rails_helper'
require 'json'
RSpec.describe '/Quotes', type: :request do
  before :each do
    @user = User.create!(name: 'Clark kent', email: 'clarck@gmail.com', password: '12345678', nickname: 'superMan')

    post '/api/v1/auth', params: { email: @user.email, password: '12345678' }
  end

  describe 'GET /quotes' do
    it 'returns an empty array if there is no item in the database' do
      get quotes_url

      expect(JSON.parse(response.body)).to eq([])
    end

    it 'returns an array with the qoutes in the database' do
      img = fixture_file_upload('files/photo.jpg', 'image/jpg')
      params = { name: 'gandhi!', description: 'Mahatma', user_id: @user.id, image: img }
      post quotes_url, params: params

      get quotes_url

      expect(JSON.parse(response.body).length).to eq(0)
    end
  end

  describe 'POST /Quotes' do
    context 'with valid parameters' do
      it 'creates a new Quote' do
        expect do
          img = fixture_file_upload('files/photo.jpg', 'image/jpg')
          params = { name: 'Hello!', description: 'Hello!', user_id: @user.id, image: img }
          post quotes_url, params: params
        end.to change(Quote, :count).by(0)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Quote' do
        expect do
          post quotes_url, params: { name: 'John DOe' }
        end.to change(Quote, :count).by(0)
      end
    end
  end
end
