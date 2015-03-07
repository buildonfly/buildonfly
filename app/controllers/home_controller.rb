class HomeController < ApplicationController
  def index
    if @user.projects.any?
    else
      redirect_to new_project_url
    end
  end
end