class Api::V1::StudentsController < Api::V1::BaseController

  # The respond_with method is part of the responders gem and will return a JSON object with the results of each action in the controller.

  def index
    respond_with Student.all
  end

  def create
    respond_with :api, :v1, Student.create(student_params)
  end

  def destroy
    respond_with Student.destroy(params[:id])
  end

  def update
    student = Student.find(params["id"])
    student.update_attributes(student_params)
    respond_with student, json: student
  end

  private

  def student_paras
    params.require(:student).permit(:id, :first_name, :last_name, :cohort)
  end

end