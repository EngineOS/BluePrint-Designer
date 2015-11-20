class RepoInspector

  require 'git'
  require 'rugged'
  require 'digest/sha1'

  def initialize
    @repo_path = ENV["GITDIR"] || "/var/lib/git"
  end

  def service_designs_file_list
    @service_designs_file_list ||= Dir.glob(@repo_path + '/service_designs/providers/**/*.yaml')
  end

  def files
    service_designs_file_list.map do |service_design_file|
      {
        service_design: read(service_design_file),
        readme: accompanying_readme_for(service_design_file)
      }
    end
  end

  def accompanying_readme_for(filepath)
    read(File.dirname(filepath) + '/readme.txt')
  end

  def read(filepath)
    file = File.new(filepath,'r')
    file_contents = file.read
    file.close
    file_contents    
  rescue Exception=>e
    log_exception(e)
    return false
  end

private

end 

