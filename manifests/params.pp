# == Class: npconfgen::params
#
class npconfgen::params {
	case $::osfamily {
		'debian': {
			if ( $::operatingsystem == 'ubuntu' ) {
				if (versioncmp($::operatingsystemrelease, '12.04') >= 0) {
					$dhcp_dir = '/etc/dhcp'
				} else {
					$dhcp_dir = '/etc/dhcp3'
				}
			} else {
				$dhcp_dir = '/etc/dhcp'
			}
			$dhcp_package_name = 'isc-dhcp-server'
			$dhcp_service_name = 'isc-dhcp-server'

			$bind_conf_dir     = '/etc/bind'
			$bind_zones_dir    = '/etc/bind'
			$bind_keys_dir     = '/etc/bind/keys'
			$bind_pri_dir      = 'pri'
			$bind_sec_dir      = 'sec'
			$bind_rev_dir      = 'rev'
			$bind_package_name = 'bind9'
			$bind_service_name = 'bind9'
			$bind_user         = 'bind'
			$bind_group        = 'bind'

			$package_provider  = undef
		}
		'darwin': {
			$dhcp_dir          = '/opt/local/etc/dhcp'
			$dhcp_package_name = 'dhcp'
			$dhcp_service_name = 'org.macports.dhcpd'

			$bind_conf_dir     = '/opt/local/etc'
			$bind_zones_dir    = '/opt/local/var/named'
			$bind_keys_dir     = '/opt/local/etc/named/keys'
			$bind_pri_dir      = 'pri'
			$bind_sec_dir      = 'sec'
			$bind_rev_dir      = 'rev'
			$bind_package_name = 'bind9'
			$bind_service_name = 'org.macports.bind9'
			$bind_user         = 'root'
			$bind_group        = 'named'

			$package_provider  = 'macports'
		}
		'freebsd': {
			$dhcp_dir          = '/usr/local/etc'
			$dhcp_package_name = 'net/isc-dhcp42-server'
			$dhcp_service_name = 'isc-dhcpd'

			$bind_conf_dir     = '/etc/namedb'
			$bind_zones_dir    = '/etc/namedb'
			$bind_keys_dir     = '/etc/namedb/keys'
			$bind_pri_dir      = 'pri'
			$bind_sec_dir      = 'sec'
			$bind_rev_dir      = 'rev'
			$bind_package_name = 'dns/bind910'
			$bind_service_name = 'named'
			$bind_user         = 'bind'
			$bind_group        = 'bind'

			$package_provider  = undef
		}
		'redhat': {
			$dhcp_dir          = '/etc/dhcp'
			$dhcp_package_name = 'dhcp'
			$dhcp_service_name = 'dhcpd'

			$bind_conf_dir     = '/etc'
			$bind_zones_dir    = '/etc/named'
			$bind_keys_dir     = '/etc/named/keys'
			$bind_pri_dir      = 'pri'
			$bind_sec_dir      = 'sec'
			$bind_rev_dir      = 'rev'
			$bind_package_name = 'bind'
			$bind_service_name = 'named'
			$bind_user         = 'root'
			$bind_group        = 'named'

			$package_provider  = undef
		}
		'gentoo': {
			$dhcp_dir          = '/etc/dhcp'
			$dhcp_package_name = 'net-misc/dhcp'
			$dhcp_service_name = 'dhcpd'

			$bind_conf_dir     = '/etc/bind'
			$bind_zones_dir    = '/var/bind'
			$bind_keys_dir     = '/etc/bind/keys'
			$bind_pri_dir      = 'pri'
			$bind_sec_dir      = 'sec'
			$bind_rev_dir      = 'rev'
			$bind_package_name = 'net-dns/bind'
			$bind_service_name = 'named'
			$bind_user         = 'root'
			$bind_group        = 'named'

			$package_provider  = undef
		}
		default: {
			fail('NetProfile configuration deployment via Puppet is currently unsupported on ${::osfamily}')
		}
	}
}

