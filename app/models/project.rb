class Project < ActiveRecord::Base
  has_many :builds
  has_many :project_assignments
  has_many :users, :through => :project_assignments

  validates_presence_of :name
  validates_presence_of :git_url
  validates_presence_of :commands
end