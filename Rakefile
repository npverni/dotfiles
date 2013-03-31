require 'rake'

DOTS_DIR      = File.expand_path('./dots', File.dirname(__FILE__))
OH_MY_ZSH_DIR = File.expand_path('./oh-my-zsh', File.dirname(__FILE__))

LIBS = Dir[File.expand_path('./lib', File.dirname(__FILE__)) + "/*.rake"]
LIBS.each{|lib| load lib}

def default_tasks
  matches = []
  LIBS.each do |lib|
    begin
      file  = File.open(lib, "r")
      lines = file.readlines.join("")
      matches << lines.scan(/task :(\w+) /)
      matches.flatten!
    ensure
      file.close
    end
  end
  matches.map{|m| m.to_sym }
end

task :default => default_tasks

