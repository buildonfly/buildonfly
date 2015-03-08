class CallbackController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_filter :require_login

  def activate_machine
    machine = Machine.find(params[:id])
    machine.active = 1
    machine.save
    render json: {}.to_json
  end
end