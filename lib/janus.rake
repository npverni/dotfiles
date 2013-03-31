require "fileutils"
include FileUtils

desc "Install Janus VIM and VIM plugins"
task :install_janus_vim => [:janus_vim, :janus_vim_plugins]

desc "Fetch / Install Janus VIM plugin manager"
task :janus_vim do
  if janus_destination?
    #todo poop pants
  else
    mkdir_p janus_destination
    cd janus_destination do
      puts "installing janus"
      begin
        `git clone https://github.com/carlhuda/janus.git .`
        `rake`
        puts "finished installing janus"
      rescue
        raise "failed janus install :{"
      end
    end
  end
end

desc "Install all the things! vim things in the janus plugin directory that is."
task :janus_vim_plugins do
  if janus_plugin_destination?
    #todo shit pants
  else
    puts "creating directory #{janus_plugin_destination}" unless janus_plugin_destination?
    mkdir_p janus_plugin_destination
    cd janus_plugin_destination do
      vim_plugins.each do |plugin|
        puts "Cloning #{plugin}"
        `git clone #{plugin}`
      end
    end
  end
end

private

def home_dir
  ENV['HOME']
end

def janus_destination
  @janus_destination ||= File.join(home_dir, ".vim", "")
end

def janus_plugin_destination
  @janus_plugin_destination ||= File.join(home_dir, ".janus", "")
end

def janus_plugin_destination?
  File.exists? janus_plugin_destination
end

def janus_destination?
  File.exists? janus_destination
end

def vim_plugins
  @vim_plugins ||= %w{
    https://github.com/vim-scripts/Align.git
    https://github.com/nono/vim-handlebars.git
    https://github.com/Lokaltog/vim-powerline.git
    https://github.com/tpope/vim-surround.git
    https://github.com/kien/rainbow_parentheses.vim.git
  }
end
