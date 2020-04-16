class PagesController < ApplicationController


    def welcome 
    end 
    
    def index 
        @students = User.all
    end

    def show
        @student = User.find(params[:student_id])
    end
end