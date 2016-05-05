# Albatross and a Red Jackal
## An apache based Vagrant Repository for Jekyll development
Just a vagrant repository for any web developement using a apache stack with Puppet, Vagant and Ruby for Jekyll (GitHub Pages) development.

## Specifications
- ip:       "192.168.33.10"
- provider: "virtualBox"
- box:      "precise64"
- hostname: "albatross"
- vb name:  "albatross.dev"
- port: 4000

## Requirements
- [Vagrant](https://www.vagrantup.com/)
- [Virtual Box](https://www.virtualbox.org/)

## Packages
The configuration for each package is located in their respective folder. The packages included are listed as follows:     
- apache
    - apache2
- GitHub Pages
    - ruby 2.0.0
    - gem "github-pages"
    - therubyracer
    
## Vagrant Box Installation
```
    $ vagrant box add precise64 http://files.vagrantup.com/precise64.box
```
    
## Installation Instructon
1.  Install [Virtual Box](https://www.virtualbox.org/wiki/Downloads) 
2.  Install [Vagrant](https://www.vagrantup.com/downloads.html)
3.  Install ['precise64'](#vagrant-box-installation) vagrant box
4.  Clone this repository 
5.  Create a directory for your developement domain on the same level as this clone
6.  Edit the VirtualHost entry in [puppet/modules/vhost/files/site.conf](/puppet/modules/vhost/files/site.conf) to point to your development domain diectory
7.  Open your hosts files
    -    For Linux based development system `` /etc/hosts ``
    -    For Windows based development system `` C:\Windows\System32\drivers\etc\hosts ``
    
8. Add the following to your machine host file 
    
    ``
        192.168.33.10 albatross.dev 
    ``
9.  Open a terminal, go to the location of the git repository and boot up the vagrant box
    
    ``
        $ vagrant up 
    ``
10. Connect to the vagrant environment
    
    ``
        $ vagrant ssh
    ``
11. ``cd`` to the development repository on your vagrant box. Should be a directory under the ``/vagrant/`` directory
12. Copy the main `Gemfile` to your repository
    
    ``
        $ mv /vagrant/Gemfile .
    ``
13. Install the gems in the `Gemfile`
    
    ``
        $ bundle install
    ``
14. Create a new jekyll site in your directory
    
    ``
        $ jekyll new . --force        
    ``
15. Start up the jekyll server
    
    ``
        $ jekyll serve --host 0.0.0.0 
    ``

And that is it! Your jekyll server should be active on port 4000

## Credits
- [Puppet.com](https://puppet.com/blog/lamp-stacks-made-easy-vagrant-puppet) - LAMP Stacks Made Easy with Vagrant & Puppet 
- [jrodriguezjr/puppet-lamp-stack](https://github.com/jrodriguezjr/puppet-lamp-stack)
- [thruflo/vagrant-jekyll](https://github.com/thruflo/vagrant-jekyll)
- [GitHub - Setting up your GitHub Pages site locally with Jekyll](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/#step-1-create-a-local-repository-for-your-jekyll-site)
- [Puppet CookBook](http://www.puppetcookbook.com/)
- [Google groups - Puppet Users](https://groups.google.com/forum/#!topic/puppet-users/w7D5695FCls)
- [Jes.al for Ruby and Jekyll installation](http://jes.al/2014/04/setup-dev-environment-using-vagrant-puppet-part-ii/)
- [Bundler - Gemfile ruby version](http://bundler.io/v1.3/gemfile_ruby.html)
- [Jekyll](https://jekyllrb.com/)
- [Stacoverflow - Connecting to Jekyll server on Vagrant from outside](http://stackoverflow.com/questions/27617217/cannot-reach-jekyll-server-on-vagrant-from-outside)