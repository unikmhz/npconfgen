# == Class: npconfgen::dhcp
#
class npconfgen::dhcp (
	$interface        = 'NOTSET',
	$interfaces       = undef,
	$confgen_host     = $::fqdn,
	$confgen_service  = 'iscdhcp',
	$dir              = $::npconfgen::params::dhcp_dir,
	$package_name     = $::npconfgen::params::dhcp_package_name,
	$package_provider = $::npconfgen::params::package_provider,
	$service_name     = $::npconfgen::params::dhcp_service_name,
	$service_ensure   = running,
) inherits ::npconfgen::params {

	if $interface != 'NOTSET' {
		$dhcp_interfaces = [ $interface ]
	} elsif $interfaces != undef {
		$dhcp_interfaces = $interfaces
	} else {
		$dhcp_interfaces = []
	}

	package { $package_name:
		ensure   => installed,
		provider => $package_provider,
	}

	file { $dir:
		ensure  => directory,
		owner   => 'root',
		group   => 'root',
		mode    => '0755',
		require => Package[$package_name],
	}
	case $::osfamily {
		'debian' : {
			 file { '/etc/default/isc-dhcp-server':
				ensure  => present,
				owner   => 'root',
				group   => 'root',
				mode    => '0644',
				before  => Package[$package_name],
				notify  => Service[$service_name],
				content => template('npconfgen/dhcpd_debian.erb'),
			 }
		}
		'redhat' : {
			file { '/etc/sysconfig/dhcpd':
				ensure  => present,
				owner   => 'root',
				group   => 'root',
				mode    => '0644',
				before  => Package[$package_name],
				notify  => Service[$service_name],
				content => template('npconfgen/dhcpd_redhat.erb'),
			}
		}
		'gentoo' : {
			file { '/etc/conf.d/dhcpd':
				ensure  => present,
				owner   => 'root',
				group   => 'root',
				mode    => '0644',
				before  => Package[$package_name],
				notify  => Service[$service_name],
				content => template('npconfgen/dhcpd_gentoo.erb'),
			}
		}
		default: { }
	}
	file { "${dir}/dhcpd.conf":
		ensure  => file,
		owner   => 'root',
		group   => 'root',
		mode    => '0644',
		require => File[$dir],
		source  => "puppet:///modules/npconfgen/generated/${confgen_host}/${confgen_service}/dhcpd.conf",
	}
	service { $service_name:
		ensure    => $service_ensure,
		enable    => true,
		subscribe => File["${dir}/dhcpd.conf"],
		require   => Package[$package_name],
	}
}

