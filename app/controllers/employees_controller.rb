class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
    @employee = Employee.first
  end

  def json
    @dict = []
    @employees = Employee.all
    @employees.each do |f|
      @dict.push({id: f.id, first_name: f.first_name, last_name: f.last_name, department: Department.find(f.department).name})
    end

    render json: @dict
  end

  def new
    @employee = Employee.new
    1.times {@employee.addresses.build}
    1.times {@employee.phones.build}
  end

  def create
    # render plain: params.inspect
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to employees_path
    else render 'new'
    end
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    redirect_to employees_path
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])

    if @employee.update(employee_params)
      @employee.addresses.first.destroy
      @employee.phones.first.destroy
      redirect_to employees_path
    else render 'edit'
    end
  end

  def search
    # render plain: params.inspect
    if params[:search]
        case params[:get][:type]
          when "First Name"
            @result = Employee.where(:first_name => params[:search])
          when "Last Name"
            @result = Employee.where(:last_name => params[:search])
          when "Phone Number"
            @result = Employee.find(Phone.where(:phone => params[:search]).pluck(:employee_id))
          when "Zip Code"
            @result = Employee.find(Address.where(:zip_code => params[:search]).pluck(:employee_id))
        end
    end
  end

  private
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :department_id, :position_id, :status_id,
                                     addresses_attributes: [:address_type_id, :address1, :address2, :city, :state, :zip_code, :status_id],
                                      phones_attributes: [:phone_type_id, :phone, :status_id])
  end

end
