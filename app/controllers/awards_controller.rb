class AwardsController < ApplicationController
    before_action :authorized, only: [:create, :update, :delete] 
    def index 
        @user = logged_in_user 
        awards = Award.all 
        render json: awards  
    end  

    def show 
        @user = logged_in_user 
        award = Award.find(params[:id]) 
        render json: award 
    end 

    def create 
        award = @user.awards.create(award_params) 
        render json: award  
    end 

    def update 
        award = @user.awards.find(params[:id]) 
        award.update(award_params) 
        render json: award   
    end 

    def destroy 
        award = Award.find(params[:id]) 
        unless award.nil?
            award.destroy  
            render json: award   
        else  
            render json: {error: "Award not found"}, status: 404 
        end 
    end 

    private 

    def award_params 
        params.permit(:user_id, :description, :received_date)    
    end 
end
