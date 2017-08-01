class Api::V1::CoursesController < ApplicationController
  def index
    @courses = Course.all
    {courses: json_response(@courses)}.to_json  #to format similarly to lessonly docs
  end

  def show
    @course = Course.find(params[:id])
    format_course_details(json_response(@course), @course)
  end

  def assignments
    @course = Course.find(params[:id])
    a = @course.lessons.map do |lesson|
      lesson.assignments
    end
    {assignments: json_response(a.flatten) }.to_json
  end

private

  def format_course_details(json, course)
    hash = JSON.parse(json)
    hash[:lessons] = course.lessons.select(:id, :title)
    hash.to_json
  end
end
