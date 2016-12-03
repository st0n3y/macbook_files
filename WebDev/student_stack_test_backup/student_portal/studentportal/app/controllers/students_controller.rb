class StudentsController < ApplicationController
  
  def index
    students = Student.all  
    render :json => students.to_json()
  end

  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :cohort)
  end

end