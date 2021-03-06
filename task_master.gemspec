# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{task_master}
  s.version = "0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["elliottcable"]
  s.date = %q{2008-10-14}
  s.description = %q{Clean up that Rakefile, you piece of illiterate scum! *whip crack*}
  s.email = ["task_master@elliottcable.com"]
  s.extra_rdoc_files = ["lib/task_master/tasking.rb", "lib/task_master.rb", "README.markdown"]
  s.files = ["lib/task_master/tasking.rb", "lib/task_master.rb", "Rakefile.rb", "README.markdown", "spec/spec_helper.rb", "spec/task_master_spec.rb", ".manifest", "task_master.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/elliottcable/task_master}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Task_master", "--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{task-master}
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{Clean up that Rakefile, you piece of illiterate scum! *whip crack*}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<elliottcable-echoe>, [">= 0", "= 3.0.2"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<stringray>, [">= 0"])
    else
      s.add_dependency(%q<elliottcable-echoe>, [">= 0", "= 3.0.2"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<stringray>, [">= 0"])
    end
  else
    s.add_dependency(%q<elliottcable-echoe>, [">= 0", "= 3.0.2"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<stringray>, [">= 0"])
  end
end
