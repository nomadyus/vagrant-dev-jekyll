class vhost {    
    # ensures that mode_rewrite is loaded and modifies the default configuration file
    file { "/etc/apache2/mods-enabled/rewrite.load":
        ensure => link,
        target => "/etc/apache2/mods-available/rewrite.load",
        require => Package["apache2"]
    }

    # create directory
    file {"/etc/apache2/sites-enabled":
        ensure => directory,
        recurse => true,
        purge => true,
        force => true,
        before => File["/etc/apache2/sites-enabled/vhost"],
        require => Package["apache2"],
    }

    # create apache config from main vagrant manifests
    file { "/etc/apache2/sites-available/vhost":
        ensure => present,
        source => 'puppet:///modules/vhost/site.conf',
        require => Package["apache2"],
    }

    # symlink apache site to the site-enabled directory
    file { "/etc/apache2/sites-enabled/vhost":
        ensure => link,
        target => "/etc/apache2/sites-available/vhost",
        require => File["/etc/apache2/sites-available/vhost"],
        notify => Service["apache2"],
    }  

    service { "apache2":
        ensure  => "running",
        enable => true,
        require => Package["apache2"],
        subscribe => [
            File["/etc/apache2/mods-enabled/rewrite.load"],
            File["/etc/apache2/sites-available/vhost"]
        ]
    }
}
