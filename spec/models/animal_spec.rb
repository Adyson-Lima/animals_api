require 'rails_helper'

RSpec.describe Animal, type: :model do

  before{@animal = Animal.new}

  describe 'Testes de preenchimento do model Animal' do

    it 'name consegue ser preenchido?' do
      @animal.name = ''
      expect(@animal.name).to eq('cachorro')
    end

  end

end