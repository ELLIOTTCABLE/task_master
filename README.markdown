task_master
===========

*task_master* is a suite to help you clean up your [Rakefile][]. It allows you to
quickly and easily create task groups that preform specific tasks and require
specific common [RubyGems][] and project metadata, and allows you to keep your
Rakefile quite DRY. It supports many meta-project tools, and allows you to
easily write your own task groups for any tools that it doesn't support.

[Rakefile]: <http://rake.rubyforge.org/files/doc/rakefile_rdoc.html> "Rakefile Format RDoc"
[RubyGems]: <http://rubygems.org/read/chapter/1#page22> "What is a RubyGem?"

Usage
-----
FIXME: Usage summary

Installation
------------
You can install task_master as a pre-built gem, or as a gem generated directly
from the source.

The easiest way to install task_master is to use [RubyGems][] to acquire the
latest 'release' version from [RubyForge][], using the `gem` command line tool:

    sudo gem install task_master # You'll be asked for your account password.

Alternatively, you can acquire it (possibly slightly more up-to-date,
depending on how often I update the gemspec) from GitHub as follows:

    # If you've ever done this before, you don't need to do it now - see http://gems.github.com
    gem sources -a http://gems.github.com
    sudo gem install elliottcable-task_master # You'll be asked for your account password.
    
Finally, you can build a gem from the latest source yourself. You need [git][],
as well as [rake][] and elliottcable's clone of [echoe][]:

    git clone git://github.com/elliottcable/task_master.git
    cd task_master
    # If you've ever done this before, you don't need to do it now - see http://gems.github.com
    gem sources -a http://gems.github.com
    sudo gem install elliottcable-echoe # You'll be asked for your account password.
    rake install # You'll be asked for your account password.

[RubyGems]: <http://rubyforge.org/projects/rubygems/> "RubyGems - Ruby package manager"
[RubyForge]: <http://rubyforge.org/projects/task-master/> "task_master on RubyForge"
[git]: <http://git-scm.com/> "git - Fast Version Control System"
[Rake]: <http://rake.rubyforge.org/> "RAKE - Ruby Make"
[echoe]: <http://github.com/fauna/echoe> "If you don't want to hoe, echoe"

Contributing
------------
You can contribute bug fixes or new features to task_master by forking the project
on GitHub (you'll need to register for an account first), and sending me a
pull request once you've committed your changes.

Links
-----
- [GitHub](http://github.com/elliottcable/task_master "task_master on GitHub") is the
    project's primary repository host, and currently also the project's home
    page
- [RubyForge](http://rubyforge.org/projects/task-master "task_master on RubyForge") is
    out primary RubyGem host, as well as an alternative repository host
- [integrity](http://integrit.yreality.net/task_master "task_master on yreality's integrity server")
    is our continuous integration server - if the top build on that page is
    green, you can assume the latest git HEAD is safe to run/install/utilize.
- [Gitorious](http://gitorious.org/projects/task_master "task_master on Gitorious") is
    an alternative repository host
- [repo.or.cz](http://repo.or.cz/w/task_master.git "task_master on repo.or.cz") is
    an alternative repository host

License
-------
task_master is copyright 2008 by elliott cable.

task_master is released under the [GNU General Public License v3.0][gpl], which
allows you to freely utilize, modify, and distribute all task_master's source code
(subject to the terms of the aforementioned license).

[gpl]: <http://www.gnu.org/licenses/gpl.txt> "The GNU General Public License v3.0"