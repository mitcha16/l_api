class Api::V1::CoursesController < ApplicationController

  def index
    @courses = Course.all
    json_response(@courses)
  end

  def show
    @course = Course.find(params[:id])
    json_response(@course)
  end
end
