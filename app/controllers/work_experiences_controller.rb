class WorkExperiencesController < ApplicationController
    before_action :authorized, only: [:create, :update, :delete] 
    def index 
        @user = logged_in_user 
        work_experiences = WorkExperience.all 
        render json: work_experiences 
    end  

    def show 
        @user = logged_in_user 
        work_experience = WorkExperience.find(params[:id]) 
        render json: work_experience
    end 

    def create 
        work_experience = @user.work_experiences.create(work_experience_params) 
        render json: work_experience 
    end 

    def update 
        work_experience = @user.work_experiences.find(params[:id]) 
        work_experience.update(work_experience_params) 
        render json: work_experience 
    end 

    def destroy 
        work_experience = WorkExperience.find(params[:id]) 
        unless work_experience.nil?
            work_experience.destroy  
            render json: work_experience   
        else  
            render json: {error: "Work experience not found"}, status: 404 
        end 
    end 

    private 

    def work_experience_params 
        params.permit(:user_id, :chef_type, :experience, :employer_name, :start_date, :end_date, :current_workplace, :title, :description, :city, :state, :country)  
    end 
end
