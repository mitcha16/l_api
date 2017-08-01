class Api::V1::LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
    {lessons: json_response(@lessons)}.to_json  #to format similarly to lessonly docs
  end

  def show
    @lesson = Lesson.find(params[:id])
    json_response(@lesson)
  end

  def assignments
    @lesson = Lesson.find(params[:id])
    @assignments = @lesson.assignments
    {assignments: json_response(@assignments)}.to_json
  end
end
