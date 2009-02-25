namespace :radiant do
  namespace :extensions do
    namespace :code do
      
      desc "Runs the migration of the Code extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          CodeExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          CodeExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Code to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from CodeExtension"
        Dir[CodeExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(CodeExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
