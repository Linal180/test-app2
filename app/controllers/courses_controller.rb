class CoursesController < ApplicationController

    before_action :set_course, only: [:show, :edit, :update]

    def index
        @courses = Course.all
    end

    def new 
        @course = Course.new
    end 

    def show
        
    end 

    def my_courses
        @student_courses = StudentCourse.where(user:current_user)
        @my_courses = []
        @student_courses.each do |rel|
            course = Course.find(rel.course_id)
            @my_courses.push(course)
        end
        
    end

    def create 
        @course = Course.new(course_params)
        if @course && @course.save
            flash[:notice] = "Course was added successfully"
            redirect_to @course
        else
            flash[:notice] = "Something went wrong"
            render 'new'
        end
    end 

    

    private

    def set_course
        @course = Course.find(params[:id])
    end

    def course_params
        params.require(:course).permit(:short_name, :name, :description)
    end
end