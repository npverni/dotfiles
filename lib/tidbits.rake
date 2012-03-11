require "fileutils"
include FileUtils

desc "Install MHS Tidbits"
task :install_tidbits do
  if tidbits_are_installed?
    # todo
  else
    cd home_dir do
      puts "installing tidbits"
      begin
        `git clone https://github.com/mhs/tidbits.git #{tidbit_destination}`
        puts "finished installing tidbits"
      rescue
        puts "failed tidbit install :("
      end
    end
  end
end

private

def home_dir
  ENV['HOME']
end

def tidbit_destination
  File.join(home_dir, ".tidbits")
end

def tidbits_are_installed?
  File.exists? tidbit_destination
end
