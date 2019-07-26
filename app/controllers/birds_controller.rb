class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    #could also use:   render json: birds, except: [:created_at, :updated_at]
  end

  # def index
  #   birds = Bird.all
  #   render json: birds.to_json(except: [:created_at, :updated_at])
  # end
  #above method without rails magic

def show
  bird = Bird.find_by(id: params[:id])
  if bird
    render json: { id: bird.id, name: bird.name, species: bird.species }
  else
    render json: { message: 'Bird not found' }
  end
end

  # def show
  #   bird = Bird.find_by(id: params[:id])
  #   render json: bird.slice(:id, :name, :species)
  # end

  # def show
  #   bird = Bird.find_by(id: params[:id])
  #   render json: {id: bird.id, name: bird.name, species: bird.species }
  # end
  #same as method above

end
