class CampersController < ApplicationController

#GET /campers
    def index
        campers = Camper.all
        render json: campers, include: ['id', 'name', 'age'], status: :ok
    end

#GET /campers/:id
    def show
        camper = Camper.find(params[:id])
        render json: camper
    rescue ActiveRecord::RecordNotFound
        render json: { error: "Camper not found" }, status: :not_found
    end


#POST /campers

def create
    camper = Camper.create!(camper_params)
render json: camper, status: :created
rescue ActiveRecord::RecordInvalid => invalid
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
end

private
def camper_params
    params.permit(:name, :age)
end

end

