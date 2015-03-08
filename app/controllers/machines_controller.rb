class MachinesController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    @machines = @project.machines
    @show_alert_message = @machines.select{|m| !m.is_active?}.any?
    if params[:format] == 'json'
      machines_json = []
      @machines.each_with_index do |machine, index|
        machine_json = {
          id: machine.id,
          name: "machine#{index+1}"
        }
        if machine.is_active?
          machine_json[:is_active] = true
        elsif machine.ready_for_setup?
          machine_json[:ready_for_setup] = true
        elsif machine.setup_in_progress?
          machine_json[:setup_in_progress] = true
        elsif machine.setup_failed?
          machine_json[:setup_failed] = true
        end
        machines_json << machine_json
      end
      render json: machines_json.to_json
    else
      render :index
    end
  end

  def setup
    machine = Machine.find(params[:id])
    machine.status = 'in_progress'
    machine.save

    machine.setup
    render json: {}
  end

  def status

  end
end