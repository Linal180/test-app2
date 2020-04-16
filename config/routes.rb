Rails.application.routes.draw do
  devise_for :users
  root 'pages#welcome'
  get 'students', to: 'pages#index'
  get "student_profile", to: 'pages#show'
  get 'my_courses', to: 'courses#my_courses'
  resources :courses
  post 'course_enroll', to: 'student_courses#create'
  delete 'course_withdraw', to: 'student_courses#destroy'
end
