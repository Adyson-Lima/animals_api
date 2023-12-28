class Api::V1::AnimalsController < ApplicationController

  before_action :set_animal, only: %i[show] # show update destroy

  def index
    @animals = Animal.all 
    render json: @animals
  end

  def show
    render json: @animal
  end

private

def set_animal
  @animal = Animal.find(params[:id])
end

def animal_params
  params.require(:animal).permit(:name, :size)
end

end