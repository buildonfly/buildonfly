class SignupController < ApplicationController
  skip_before_filter :require_login

  def new
  end

  def create
    if params[:password] != params[:confirm_password]
      flash.now[:error] = 'Passwords do not match'
    else
      user = User.new(fullname: params[:fullname], email: params[:email], password: params[:password], active: 1)
      if user.save
        session[:user_id] = user.id
      else
        flash.now[:error] = 'Email has already been taken'
      end
    end

    if flash.now[:error]
      render :new
    else
      redirect_to root_url
    end
  end
end
