class HomeController < ApplicationController
  def index
    if @user.projects.any?
      redirect_to :controller => 'projects', :action => 'show', :id => @user.projects.last
    else
      redirect_to new_project_url
    end
  end
end