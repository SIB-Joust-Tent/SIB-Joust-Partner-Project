class EmployeesController < ApplicationController
  # GET /employees
  def index
    @employee = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
  	@employee = Employee.new(params[:employee])

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

    def update
    @employee = Employee.find(params[:id])

    respond_to do |format|
      if @employee.update_attributes(params[:employee])
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employee_url }
    end
  end
end