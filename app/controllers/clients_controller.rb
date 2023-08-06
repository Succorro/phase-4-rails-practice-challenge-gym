class ClientsController < ApplicationController
    
    def index 
        render json: Client.all, status: :ok
    end 

    def show 
        render json: find_client,methods: [:client_total],includes: :memberships, status: :ok
    end 

    def update 
        client = find_client
        client.update!(client_params)
        render json: client, status: :accepted
    end 

    private 

    def find_client 
        Client.find(params[:id])
    end 

    def client_params 
        params.permit(:name, :age)
    end 
end
