require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:users) { FactoryBot.create_list(:user, 10) }

  context 'GET: /api/users' do
    before do
      users
      get '/api/users'
      @json = JSON.parse(response.body)
    end

    it 'status is 200' do
      expect(response.status).to eq(200)
    end

    it 'can get 10 users' do
      expect(@json['data'].length).to eq(10)
    end
  end

  context 'GET: api/uers/:id' do
    before do
      @user = user
      get "/api/users/#{@user.id}"
      @json = JSON.parse(response.body)
    end

    it 'status is 200' do
      expect(response.status).to eq(200)
    end

    it 'can get the user' do
      expect(@json['data']['id']).to eq(@user.id)
    end
  end
end
