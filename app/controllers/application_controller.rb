class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  # before_action :authenticate_teacher!

  def after_sign_in_path_for(resource)
    # TODO: SOLVE LOGIN REDIRECTION PAGE
    my_courses_user_path(current_user) if user_signed_in?
    my_courses_teacher_path(current_teacher) if teacher_signed_in?
  end
end
