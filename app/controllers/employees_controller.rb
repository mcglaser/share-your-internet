class EmployeesController < ApplicationController
  def index
  end

  def create
    employee = Employee.find_or_create_by(:uid => auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
    end
#    session[:user_id] = user.id
     redirect_to employees_path
  end
 
  def auth
    request.env['omniauth.auth']
  end





end