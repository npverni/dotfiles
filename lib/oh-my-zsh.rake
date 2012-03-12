require "fileutils"
include FileUtils

desc "Install oh-my-zsh"
task :install_oh_my_zsh do
  if oh_my_zsh_are_installed?
    # todo
  else
    cd home_dir do
      puts "installing oh-my-zsh"
      begin
        `git clone https://github.com/robbyrussell/oh-my-zsh.git #{oh_my_zsh_destination}`
        puts "finished installing oh-my-zsh"
      rescue
        puts "failed oh-my-zsh install :("
      end
    end
  end
end

desc "Copy all custom oh-my-zsh plugins to the proper place"
task :copy_custom_oh_my_zsh do
  cp_r File.join(OH_MY_ZSH_DIR, "custom"), oh_my_zsh_custom_destination
end

private

def home_dir
  ENV['HOME']
end

def oh_my_zsh_custom_destination
  File.join(oh_my_zsh_destination, "")
end

def oh_my_zsh_destination
  File.join(home_dir, ".oh-my-zsh", "")
end

def oh_my_zsh_are_installed?
  File.exists? oh_my_zsh_destination
end
