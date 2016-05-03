Exec { path => [ "/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/", "/usrc/local/", "/usr/local/rvm/bin/", "/usr/local/rvm/scripts/" ] }

package { ['vim', 'curl', 'git']:
	ensure  => 'installed',
	require => Exec['apt-get update'],
}

class system-update {
	exec { 'apt-get update':
		command => 'apt-get update',
	}
	
	$sysPackages = [ "build-essential" ]
	package { $sysPackages:
		ensure => "installed",
		require => Exec['apt-get update'],
	}
}

# Included Modules
include system-update
include github-pages
include apache
include vhost