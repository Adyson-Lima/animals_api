require 'rails_helper'

RSpec.describe Animal, type: :model do

  before{@animal = Animal.new}

  describe 'Testes de preenchimento do model Animal' do

    it 'name consegue ser preenchido?' do
      @animal.name = 'cachorro'
      expect(@animal.name).to eq('cachorro')
    end

    it 'size consegue ser preenchido?' do
      @animal.size = 'medio porte'
      expect(@animal.size).to eq('medio porte')
    end

  end

  describe 'Testes de validacao do model Animal' do

    it 'objeto animal valido com campos obrigatorios preenchidos?' do
      @animal.name = 'gato'
      @animal.size = 'pequeno porte'
      expect(@animal).to be_valid
    end

    it 'objeto animal invalido com campos obrigatorios não preenchidos?' do
      animal = Animal.new
      expect(animal).to be_invalid
    end

  end

end