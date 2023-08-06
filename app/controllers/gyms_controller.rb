class GymsController < ApplicationController
    def index 
        render json: Gym.all, status: :ok
    end 

    def show 
        render json: find_gym, status: :ok
    end 

    def update 
        gym = find_gym 
        gym.update!(gym_params)
        render json: gym, status: :accepted
    end 


    def destroy 
        gym = find_gym
        gym.destroy 
        render json: {}, status: :no_content
    end 

    private 
    def find_gym 
        Gym.find(params[:id])
    end 

    def gym_params
        params.permit(:name, :address) 
    end 
end
