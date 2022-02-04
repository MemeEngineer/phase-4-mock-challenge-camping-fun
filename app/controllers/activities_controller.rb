class ActivitiesController < ApplicationController

    # GET /activities

    def index
        activities = Activity.all
        render json: activities, include: ['id', 'name', 'difficulty'], status: :ok
    end


    #DELETE /activities/:id

    def destroy
        activity = Activity.find(params[:id])
        activity.destroy
        head :no_content
    rescue ActiveRecord::RecordNotFound
        render json: {error:  "Activity not found"}, status: :not_found
    end

end
