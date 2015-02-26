class Repository
  def initialize current_user

  end
  
  def url
    "git@github.com:inderps/CricketWorldCup.git"
  end

  def parent_directory
    "repos"
  end

  def name
    url.split("/").last.split(".git").first
  end

  def dir
    "#{parent_directory}/#{name}"
  end


end
