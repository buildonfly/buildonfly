class Machine < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :address

  def builds attrs
    result = RestClient.get "#{address}/logs", {:params => {:page_num => attrs[:page_num]}}
    JSON.parse result
  end
end