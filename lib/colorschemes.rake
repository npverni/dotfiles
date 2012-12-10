require "fileutils"
include FileUtils


desc "Grabs and installs the tomorrow theme"
task :tomorrow_night do
  git_url = 'https://github.com/chriskempson/tomorrow-theme.git'
  fetch_theme git_url, :vim_files => 'vim/colors/*.vim', :terminal_files => "OS\\ X\\ Terminal/*.terminal"
end

desc "Grabs and installs the ir_black theme"
task :ir_black do
  git_url = "https://github.com/jperkins/IR-Black.git"
  fetch_theme git_url, :terminal_files => '*.terminal'
end

private

def fetch_theme(git_url, opts={:vim_files => false, :terminal_files => false})
  theme_name = git_url[/.*\/(.*)\.git/, 1]
  theme_dir  = File.join(tmp, theme_name)
  mkdir_p vim_theme_dir

  cd tmp do |path|
    rm_rf theme_dir if File.exists? theme_dir
    clone git_url
    open_files Dir[File.join(path, theme_name, opts[:terminal_files])]     if opts[:terminal_files]
    cp_r Dir[File.join(path, theme_name, opts[:vim_files])], vim_theme_dir if opts[:vim_files]
  end
end

def clone git_url
  `git clone #{git_url}`
end

def open_files files
  files.each do |file|
    file = file.gsub(/\s/, '\\ ')
    puts "opening file: #{file}"
    `open #{file}`
  end
end

def tmp
 "/tmp"
end

def home_dir
  ENV["HOME"]
end

def vim_theme_dir
  File.join(home_dir, ".vim", "colors", "")
end

