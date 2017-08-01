class Api::V1::AssignmentsController < ApplicationController
  def index
    @assignments = Assignment.all
    {assignments: json_response(@assignments)}.to_json  #to format similarly to lessonly docs
  end

  def show
    @assignment = Assignment.find(params[:id])
    json_response(@assignment)
  end

  def complete
    binding.pry
    @assignments = Assignment.all.where(status: 'Complete')
    {assignments: json_response(@assignments)}.to_json
  end

  def incomplete
    binding.pry
    @assignments = Assignment.all.where(status: 'Incomplete')
    {assignments: json_response(@assignments)}.to_json
  end
end
