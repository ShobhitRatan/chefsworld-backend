class AddressesController < ApplicationController
    before_action :authorized, only: [:create, :update, :delete] 
    def index 
        @user = logged_in_user 
        addresses = Address.all 
        render json: addresses 
    end  

    def show 
        @user = logged_in_user 
        address = Address.find(params[:id]) 
        render json: address 
    end 

    def create 
        
        address = @user.addresses.create(address_params) 
        render json: address 
    end 

    def update 
        address = @user.addresses.find(params[:id]) 
        address.update(address_params) 
        render json: address 

    end 

    def destroy 
        address = Address.find(params[:id]) 
        unless address.nil?
            address.destroy 
            render json: address  
        else  
            render json: {error: "Address not found"}, status: 404 
        end 
    end 

    private 

    def address_params 
        params.permit(:user_id, :address_type, :address, :city, :state, :country, :zipcode) 
    end 
end
