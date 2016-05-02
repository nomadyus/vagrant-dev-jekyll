class apache {
	package { "apache2":
		ensure  => present,
		require => Class["system-update"],
	}
}
