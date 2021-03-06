class Project < ActiveRecord::Base
  has_many :builds
  has_many :machines
  has_many :project_assignments
  has_many :users, :through => :project_assignments

  validates_presence_of :name
  validates_presence_of :git_url
  validates_uniqueness_of :name
  validates_uniqueness_of :git_url

  def primary_machine
    machines.select{|m| m.is_primary==1}.first
  end

  def any_inactive_machine?
    machines.select{|m| m.status!='active'}.any?
  end
end