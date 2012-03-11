require 'erb'
require 'fileutils'
include FileUtils


  desc "install the dot files into user's home directory"
  task :install_dots do
    replace_all = false
    finished    = false

    cd DOTS_DIR do
      Dir['*'].each do |file|
        next if %w[Rakefile README LICENSE lib zsh oh-my-zsh dots].include? file
        next if finished

        if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
          if File.identical? File.join(DOTS_DIR, file), File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
            puts "identical ~/.#{file.sub('.erb', '')}"
          elsif replace_all
            replace_file(file)
          else
            print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
            case $stdin.gets.chomp
            when 'a'
              replace_all = true
              replace_file(file)
            when 'y'
              replace_file(file)
            when 'q'
              finished = true
            else
              puts "skipping ~/.#{file.sub('.erb', '')}"
            end
          end
        else
          link_file(file)
        end
      end
    end

  end

  def replace_file(filename)
    system %Q{rm -rf "$HOME/.#{filename.sub('.erb', '')}"}
    link_file(filename)
  end

  def link_file(filename)
    filepath = File.join(DOTS_DIR, filename)
    if filepath =~ /.erb$/
      puts "generating ~/.#{filepath.sub('.erb', '')}"
      File.open(File.join(ENV['HOME'], ".#{filepath.sub('.erb', '')}"), 'w') do |new_file|
        new_file.write ERB.new(File.read(filepath)).result(binding)
      end
    else
      puts "linking ~/.#{filename}"
      system %Q{ln -s "#{filepath}" "$HOME/.#{filename}"}
    end
  end
