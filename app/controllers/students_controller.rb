class StudentsController < ApplicationController
  before_action :authenticate_teacher!  # Ensure the teacher is logged in
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  def index
    @students = current_teacher.students.includes(:subject)  # Fetch students associated with the logged-in teacher
  end

  # GET /students/:id
  def show
    # This action will display a single student's details
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # POST /students
  def create
    @student = current_teacher.students.build(student_params)  # Build a new student associated with the logged-in teacher
    if @student.save
      redirect_to students_path, notice: 'Student was successfully created.'
    else
      render :new
    end
  end

  # GET /students/:id/edit
  def edit
    # This action will render the edit form for a student
  end

  # PATCH/PUT /students/:id
  def update
    if @student.update(student_params)
      redirect_to students_path, notice: 'Student was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /students/:id
  def destroy
    @student.destroy
    redirect_to students_path, notice: 'Student was successfully deleted.'
  end

  private

  def set_student
    @student = current_teacher.students.find(params[:id])  # Fetch the student based on the logged-in teacher
  end

  def student_params
    params.require(:student).permit(:name, :marks, :subject_id)  # Permit the necessary student parameters
  end
end
