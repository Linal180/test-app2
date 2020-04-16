class Course < ApplicationRecord

    has_many :student_courses
    has_many :students, through: :student_courses

    validates :short_name, presence: true, length: {manimum: 3, maximum: 8}, uniqueness: true
    validates :name, presence: true, length: {manimum: 5, maximum: 30}, uniqueness: true
    validates :short_name, presence: true, length: {manimum: 10, maximum: 50}, uniqueness: true



    def already_enrolled?(course_id,user_id)
        if course_id && user_id
            enrolled = StudentCourse.where(course_id: course_id, user_id: user_id)
            if enrolled.exists?
                return true
            end
        end
                    
        return false

    end


end