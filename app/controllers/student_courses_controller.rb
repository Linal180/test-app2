class StudentCoursesController < ApplicationController

    def create
        course_to_add = Course.find(params[:course_id])
        unless current_user.courses.include?(course_to_add)
            StudentCourse.create(course: course_to_add, user: current_user)
            flash[:notice] = "You have successfully enrolled in #{course_to_add.short_name}"
            redirect_to courses_path
        else
            flash[:alert] = "Something went wrong with enrollment!"
            redirect_to root_path
        end
    end

    def destroy
        course_to_drop = StudentCourse.where(course_id: params[:course_id], user: current_user).first
        if course_to_drop && course_to_drop.destroy
            flash[:notice] = "You have successfully withdrawn!"
            redirect_to my_courses_path
        else
            flash[:alert] = "Something went wrong.. Withdrawal Failed!"
            redirect_to my_courses_path
        end
    end


end