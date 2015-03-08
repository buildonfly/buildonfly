class ProjectsController < ApplicationController

  def new
  end

  def show
    @project = Project.find(params[:id])
    if @user.projects.include? @project
      if @project.any_inactive_machine?
        redirect_to :controller => 'machines', :action => 'index', :project_id => @project.id
      else
        render :show
      end
    else
      render :file => "public/401.html", :status => :unauthorized
    end
  end

  def create
    project = Project.new(name: params[:name], git_url: params[:git_url])
    if project.save
      ProjectAssignment.create(project: project, user: @user, assignment_type: 'a')
      free_machine = FreeMachine.first
      project.machines.create(address: free_machine.address, is_primary: 1)
      free_machine.delete
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