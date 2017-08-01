class AssignmentsController < ApplicationController
  def index
    @assignments = Assignment.all
    json_response(@assignments)
  end

  def show
    @assignment = Assignment.find(params[:id])
    json_response(@assignment)
  end

  def change_status
    @assignment = Assignment.find(params[:id])
    @user = User.find(params[:user_id])
    @user_assignment = @assignment.user_assignments.where(["user_id = :user_id and assignment_id = :assignment_id",
                                                        { user_id: @user.id, assignment_id: @assignment.id }]).first
    @user_assignment.update_attribute(:status, 'Complete')                                                    
    json_response(@assignment)
  end
end
