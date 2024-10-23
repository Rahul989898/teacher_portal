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
      redirect_to root_path, notice: 'Student was successfully created.'
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
  @student = Student.find(params[:id])
  if @student.update(student_params)
    flash[:notice] = 'Student was successfully updated.'
    respond_to do |format|
      format.js  # This will look for update.js.erb
      format.html { redirect_to root_path }  # Fallback for regular HTML requests
    end
  else
    flash.now[:alert] = 'Error updating student. Please check the input.'
    respond_to do |format|
      format.js { render 'edit' }  # Render edit template for AJAX
      format.html { render :edit }  # Fallback for regular HTML requests
    end
  end
end





  # DELETE /students/:id
  def destroy
    @student.destroy
    redirect_to root_path, notice: 'Student was successfully deleted.'
  end

  private

  def set_student
    @student = current_teacher.students.find(params[:id])  # Fetch the student based on the logged-in teacher
  end

  def student_params
  params.require(:student).permit(:name, :marks, :subject)  # This is correct
end
end
