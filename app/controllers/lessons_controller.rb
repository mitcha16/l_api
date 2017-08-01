class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
    json_response(@lessons)
  end

  def show
    @lesson = Lesson.find(params[:id])
    json_response(@lesson)
  end
end
