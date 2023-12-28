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

  describe 'GET /api/v1/animals/id' do
    it 'Consegue listar um animal especifico e retornar status 200?' do
      get :show, params: {id: @animal.id}
      expect(response.body).to include_json(name: 'elefante')
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/v1/animals' do
    it 'Consegue criar um animal e retornar status 201?' do
      post :create, params: {animal: {name: 'cavalo', size: 'grande porte'}, format: :json}
      expect(response.body).to include_json(name: 'cavalo')
      expect(response).to have_http_status(201)
    end
  end

  describe 'PATCH /api/v1/animals/id' do
    it 'Consegue atualizar um animal e retornar status 200?' do
      animal = Animal.last
      patch :update, params: {animal: {name: 'zebra', size: 'grande porte'}, id: animal.id}
      expect(response.body).to include_json(name: 'zebra')
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE /api/v1/animals/id' do
    it 'Consegue excluir um animal e retornar status 204?' do
      animal = Animal.last
      delete :destroy, params: {id: animal.id}
      expect(Animal.all).not_to include(animal)
      expect(response).to have_http_status(204)
    end
  end

end