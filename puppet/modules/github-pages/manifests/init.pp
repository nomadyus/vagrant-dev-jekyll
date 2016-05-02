class github-pages {
	package {'ruby':
		ensure  => 'installed',
		require => Class['system-update'],
        notify => Exec['install-rvm'],
	}
    
    exec {'gpg-signature':
        command => 'sudo gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3',
        notify => Exec['install-rvm'],
    }
    
    exec {'install-rvm': 
        command => 'sudo curl -L https://get.rvm.io | bash -s stable --ruby',
        require => [Package['curl'], Exec['gpg-signature']],
        notify => Exec['update-ruby'],
    }
    
    exec {'update-ruby':
        command => 'rvm install 2.0.0',
        onlyif => 'type rvm | head -1 | grep -c \'rvm is a function\' | wc -l',
        require => Exec['install-rvm'],
        notify => Exec['use-ruby2'],
        logoutput => true,
    }
    
    exec {'use-ruby2':
        command => 'rvm use 2.0.0',
        onlyif => 'rvm list | grep -c 2.0.0 | wc -l',
        require => Exec['update-ruby'],
        notify => Exec['install-bundler'],
        logoutput => true,
    }
    
    exec {'install-bundler':
        command => 'sudo gem install bundler',
        onlyif => 'dpkg -l | grep -c ruby | wc -l',
		require => [Package['ruby'], Exec['use-ruby2']],
        notify => Exec['gemfile-gems-install'],
        logoutput => true,
    }
    
    exec {'gemfile-gems-install':
        command => 'sudo bundle install',
        onlyif => 'gem list | grep -c bundler | wc -l',
		require => [Package['ruby'], Exec['install-bundler']],
        logoutput => true,
    }
    
    file {'/vagrant/Gemfile':
        source  => 'puppet:///modules/github-pages/Gemfile',
		require => Package['ruby'],
    }
}
