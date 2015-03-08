class Machine < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :address

  def builds attrs
    result = RestClient.get "#{address}/logs", {:params => {:page_num => attrs[:page_num]}}
    JSON.parse result
  end

  def is_active?
    status == 'active'
  end

  def ready_for_setup?
    status == 'fresh'
  end

  def setup_in_progress?
    status == 'in_progress'
  end

  def setup_failed?
    status == 'failed'
  end

  def setup
    RestClient.post "#{address}/setup", { :url=> project.git_url, :callback_url => machine_activation_callback_url }, :content_type => :json, :accept => :json
  end

  private
  def machine_activation_callback_url
    "#{system_url}/activate_machine?id=#{id}"
  end

  def system_url
    "http://localhost:3000"
  end
end