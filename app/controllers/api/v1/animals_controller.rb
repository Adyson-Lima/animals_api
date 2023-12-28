class Api::V1::AnimalsController < ApplicationController

  before_action :set_animal, only: %i[show] # show update destroy

  def index
    @animals = Animal.all 
    render json: @animals
  end

  def show
    render json: @animal
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      render json: @animal, status: :created, location: api_v1_animal_url(@animal)
    else
      render json: @animal.errors, status: :unprocessable_entity
    end
  end

private

def set_animal
  @animal = Animal.find(params[:id])
end

def animal_params
  params.require(:animal).permit(:name, :size)
end

end