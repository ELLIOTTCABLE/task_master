($:.unshift File.expand_path(File.join( File.dirname(__FILE__), 'lib' ))).uniq!
require 'task_master'

# =======================
# = Gem packaging tasks =
# =======================
begin
  require 'echoe'
  
  task :package => :'package:install'
  task :manifest => :'package:manifest'
  namespace :package do
    Echoe.new('task_master', TaskMaster::Version) do |g|
      g.project = 'task-master'
      g.author = ['elliottcable']
      g.email = ['task_master@elliottcable.com']
      g.summary = 'Clean up that Rakefile, you piece of illiterate scum! *whip crack*'
      g.url = 'http://github.com/elliottcable/task_master'
      g.development_dependencies = ['elliottcable-echoe >= 3.0.2', 'rspec', 'rcov', 'yard', 'stringray']
      g.manifest_name = '.manifest'
      g.retain_gemspec = true
      g.rakefile_name = 'Rakefile.rb'
      g.ignore_pattern = /^\.git\/|^meta\/|\.gemspec/
    end
  
    desc 'tests packaged files to ensure they are all present'
    task :verify => :package do
      # An error message will be displayed if files are missing
      if system %(ruby -e "require 'rubygems'; require 'pkg/task_master-#{TaskMaster::Version}/lib/task_master'")
        puts "\nThe library files are present"
      end
    end
  end
  
rescue LoadError
  desc 'You need the `elliottcable-echoe` gem to package task_master'
  task :package
end

# =======================
# = Spec/Coverage tasks =
# =======================
begin
  require 'spec'
  require 'rcov'
  require 'spec/rake/spectask'
  
  task :default => :'coverage:run'
  task :coverage => :'coverage:run'
  namespace :coverage do
    Spec::Rake::SpecTask.new(:run) do |t|
      t.spec_opts = ["--format", "specdoc"]
      t.spec_opts << "--colour" unless ENV['CI']
      t.spec_files = Dir['spec/**/*_spec.rb'].sort
      t.libs = ['lib']
      t.rcov = true
      t.rcov_opts = [ '--include-file', '"^lib"', '--exclude-only', '".*"']
      t.rcov_dir = File.join('meta', 'coverage')
    end
    
    begin
      require 'spec/rake/verify_rcov'
      # For the moment, this is the only way I know of to fix RCov. I may
      # release the fix as it's own gem at some point in the near future.
      require 'stringray/core_ext/spec/rake/verify_rcov'
      RCov::VerifyTask.new(:verify) do |t|
        t.threshold = 50.0
        t.index_html = File.join('meta', 'coverage', 'index.html')
        t.require_exact_threshold = false
      end
    rescue LoadError
      desc 'You need the `stringray` gem to verify coverage'
      task :verify
    end
    
    task :open do
      system 'open ' + File.join('meta', 'coverage', 'index.html') if PLATFORM['darwin']
    end
  end
  
rescue LoadError
  desc 'You need the `rcov` and `rspec` gems to run specs/coverage'
  task :coverage
end

# =======================
# = Documentation tasks =
# =======================
begin
  require 'yard'
  require 'yard/rake/yardoc_task'
  
  task :documentation => :'documentation:generate'
  namespace :documentation do
    YARD::Rake::YardocTask.new :generate do |t|
      t.files   = ['lib/**/*.rb']
      t.options = ['--output-dir', File.join('meta', 'documentation'),
                   '--readme', 'README.markdown']
    end
    
    YARD::Rake::YardocTask.new :dotyardoc do |t|
      t.files   = ['lib/**/*.rb']
      t.options = ['--no-output',
                   '--readme', 'README.markdown']
    end
    
    class Numeric
      def pretty_inspect(decimal_points = 3)
        bits = self.to_s.split('.')
        bits[0] = bits[0].reverse.scan(/\d{1,3}/).join(',').reverse
        bits[1] = bits[1][0...decimal_points] if bits[1]
        bits.join('.')
      end
    end
    
    task :verify do
      documentation_threshold = 50.0
      doc = YARD::CLI::Yardoc.new; doc.generate = false; doc.run
      
      percent_documented = (
        YARD::Registry.all.select {|o| !o.docstring.empty? }.size /
        YARD::Registry.all.size.to_f
      ) * 100
      puts "Documentation coverage: #{percent_documented.pretty_inspect(1)}% (threshold: #{documentation_threshold.pretty_inspect(1)}%)"
    end
    
    task :open do
      system 'open ' + File.join('meta', 'documentation', 'index.html') if PLATFORM['darwin']
    end
  end
  
rescue LoadError
  desc 'You need the `yard` gem to generate documentation'
  task :documentation
end

# =========
# = Other =
# =========
desc 'Removes all meta producs'
task :clobber do
  `rm -rf #{File.expand_path(File.join( File.dirname(__FILE__), 'meta' ))}`
end

desc 'Check everything over before commiting'
task :aok => [:'documentation:generate', :'documentation:open',
              :'package:manifest', :'package:package',
              :'coverage:run', :'coverage:open',
              :'coverage:verify', :'documentation:verify']

task :ci => [:'documentation:generate', :'coverage:run', :'coverage:verify']