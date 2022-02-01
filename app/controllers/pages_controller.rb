class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]
  # skip_before_action :authenticate_teacher!, only: [ :home ]

  def home
    @courses = Course.all
  end
end
