class CoursesController < ApplicationController

  def index
    @courses = Course.all
    json_response(@courses)
  end
end
