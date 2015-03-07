class ProjectsController < ApplicationController

  def new
  end

  def create
    project = Project.new(name: params[:name], git_url: params[:git_url])
    if project.save
      ProjectAssignment.create(project: project, user: @user, assignment_type: 'a')
    else
      flash.now[:error] = 'System error'
    end

    if flash.now[:error]
      render 'new'
    else
      redirect_to root_url
    end
  end
end