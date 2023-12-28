require 'rails_helper'

RSpec.describe Api::V1::AnimalsController, type: :controller do

  before{@animal = Animal.create(name: 'elefante', size: 'grande porte')}

  describe 'GET /api/v1/animals' do
    it 'Consegue listar todos os animals e retornar status 200?' do
      get :index
      expect(JSON.parse(response.body).size).to eq(1)
      expect(response).to have_http_status(200) 
    end
  end

end