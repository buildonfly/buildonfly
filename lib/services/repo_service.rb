class RepoService
  def initialize current_user
    @repository = Repository.new current_user 
  end

  def setup
    FileUtils.mkdir_p @repository.parent_directory unless File.directory?(@repository.parent_directory)
    Dir.chdir @repository.parent_directory
    if File.directory?(@repository.name)
      system "cd #{@repository.dir} &&  git reset --hard && git pull --rebase"
    else
      system "cd #{@repository.dir} && git clone #{@repository.url}"  
    end
  end

  def build
    setup
    @repository.build_commands.each do |command|
      system "cd #{@repository.dir} && #{command}"
    end
  end
end
