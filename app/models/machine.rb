class Machine < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :address

  def builds attrs
    result = RestClient.get "#{address}/logs", {:params => {:page_num => attrs[:page_num]}}
    JSON.parse result
  end

  def is_active?
    active == 1
  end

  def setup
    RestClient.post "#{address}/setup", { :callback_url => machine_activation_callback_url }, :content_type => :json, :accept => :json
  end

  def machine_activation_callback_url
    "#{system_url}/activate_machine?id=#{id}"
  end

  def system_url
    "http://localhost:3000"
  end
end