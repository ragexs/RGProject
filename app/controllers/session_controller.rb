class SessionController < ApplicationController
  def new

  end
  def create
    user = User.find_by_name(params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to todo_lists_path
    else
      render 'new'
    end

  end

  def destroy
    sign_out
    redirect_to signin_path
  end
end
