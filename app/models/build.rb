class Build < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :status
  validates_presence_of :commit_id
end