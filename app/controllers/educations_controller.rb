class EducationsController < ApplicationController
    before_action :authorized, only: [:create, :update, :delete] 
    def index 
        @user = logged_in_user 
        educations = Education.all 
        render json: educations 
    end  

    def show 
        @user = logged_in_user 
        education = Education.find(params[:id]) 
        render json: education 
    end 

    def create 
        education = @user.educations.create(education_params) 
        render json: education 
    end 

    def update 
        education = @user.educations.find(params[:id]) 
        education.update(education_params) 
        render json: education  
    end 

    def destroy 
        education = Education.find(params[:id]) 
        unless education.nil?
            education.destroy  
            render json: education   
        else  
            render json: {error: "Education not found"}, status: 404 
        end 
    end 

    private 

    def education_params 
        params.permit(:user_id, :description, :entry_date, :end_date, :enrollment_status)   
    end 
end
