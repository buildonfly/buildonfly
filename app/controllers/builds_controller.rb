class BuildsController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    formatted_builds = []
    all_builds = @project.primary_machine.builds({page_num: params[:page_num]})
    builds_executed = @project.builds
    all_builds.each do |build|
      formatted_builds << {
          commit_message: build["message"],
          commit_id: build["commit_id"],
          date: Time.at(build["date"].to_i).strftime("%A, %B %d, %Y %r"),
          ready_to_download: true
      }
    end

    formatted_builds[0][:ready_to_download] = false
    formatted_builds[0][:ready_to_build] = true
    render json: formatted_builds.to_json
  end
end