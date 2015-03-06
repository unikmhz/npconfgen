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
			$dhcp_package_name    = 'isc-dhcp-server'
			$dhcp_service_name    = 'isc-dhcp-server'

			$bind_track_conf_dir  = true
			$bind_conf_user       = 'root'
			$bind_conf_group      = 'bind'
			$bind_conf_mode       = '0644'
			$bind_conf_dir        = '/etc/bind'
			$bind_conf_dir_user   = 'root'
			$bind_conf_dir_group  = 'bind'
			$bind_conf_dir_mode   = '2755'
			$bind_zones_dir       = '/etc/bind'
			$bind_zones_dir_user  = 'root'
			$bind_zones_dir_group = 'bind'
			$bind_zones_dir_mode  = '2755'
			$bind_work_dir        = '/var/cache/bind'
			$bind_work_dir_user   = 'root'
			$bind_work_dir_group  = 'bind'
			$bind_work_dir_mode   = '0775'
			$bind_keys_dir        = '/etc/bind/keys'
			$bind_keys_dir_user   = 'root'
			$bind_keys_dir_group  = 'bind'
			$bind_keys_dir_mode   = '0750'
			$bind_pri_dir         = 'pri'
			$bind_sec_dir         = 'sec'
			$bind_sec_dir_user    = 'root'
			$bind_sec_dir_group   = 'bind'
			$bind_sec_dir_mode    = '0770'
			$bind_rev_dir         = 'rev'
			$bind_rndc_file       = '/etc/bind/rndc.key'
			$bind_rndc_key        = 'rndc-key'
			$bind_pid_file        = undef
			$bind_sesskey_file    = undef
			$bind_stats_file      = 'named.stats'
			$bind_memstats_file   = 'named.memstats'
			$bind_dump_file       = 'named_dump.db'
			$bind_keys_file       = undef
			$bind_rootkey_file    = undef
			$bind_managedkeys_dir = undef
			$bind_zone_root       = '/etc/bind/db.root'
			$bind_zone_empty      = '/etc/bind/db.empty'
			$bind_zone_localhost  = '/etc/bind/db.local'
			$bind_zone_127        = '/etc/bind/db.127'
			$bind_zone_0          = '/etc/bind/db.0'
			$bind_zone_255        = '/etc/bind/db.255'
			$bind_package_name    = 'bind9'
			$bind_service_name    = 'bind9'

			$package_provider     = undef
		}
		'redhat': {
			$dhcp_dir             = '/etc/dhcp'
			$dhcp_package_name    = 'dhcp'
			$dhcp_service_name    = 'dhcpd'

			$bind_track_conf_dir  = false
			$bind_conf_user       = 'root'
			$bind_conf_group      = 'named'
			$bind_conf_mode       = '0640'
			$bind_conf_dir        = '/etc'
			$bind_conf_dir_user   = 'root'
			$bind_conf_dir_group  = 'root'
			$bind_conf_dir_mode   = '0755'
			$bind_zones_dir       = '/etc/named'
			$bind_zones_dir_user  = 'root'
			$bind_zones_dir_group = 'named'
			$bind_zones_dir_mode  = '0750'
			$bind_work_dir        = '/var/named'
			$bind_work_dir_user   = 'root'
			$bind_work_dir_group  = 'named'
			$bind_work_dir_mode   = '0750'
			$bind_keys_dir        = '/etc/named/keys'
			$bind_keys_dir_user   = 'root'
			$bind_keys_dir_group  = 'named'
			$bind_keys_dir_mode   = '0750'
			$bind_pri_dir         = 'pri'
			$bind_sec_dir         = 'sec'
			$bind_sec_dir_user    = 'root'
			$bind_sec_dir_group   = 'named'
			$bind_sec_dir_mode    = '0770'
			$bind_rev_dir         = 'rev'
			$bind_rndc_file       = undef
			$bind_rndc_key        = undef
			$bind_pid_file        = '/run/named/named.pid'
			$bind_sesskey_file    = '/run/named/session.key'
			$bind_stats_file      = '/var/named/data/named_stats.txt'
			$bind_memstats_file   = '/var/named/data/named_mem_stats.txt'
			$bind_dump_file       = '/var/named/data/cache_dump.db'
			$bind_keys_file       = '/etc/named.iscdlv.key'
			$bind_rootkey_file    = '/etc/named.root.key'
			$bind_managedkeys_dir = '/var/named/dynamic'
			$bind_zone_root       = 'named.ca'
			$bind_zone_empty      = 'named.empty'
			$bind_zone_localhost  = 'named.localhost'
			$bind_zone_127        = undef # was 'named.loopback'
			$bind_zone_0          = 'named.empty'
			$bind_zone_255        = 'named.empty'
			$bind_package_name    = 'bind'
			$bind_service_name    = 'named'

			$package_provider     = undef
		}
		'gentoo': {
			$dhcp_dir             = '/etc/dhcp'
			$dhcp_package_name    = 'net-misc/dhcp'
			$dhcp_service_name    = 'dhcpd'

			$bind_track_conf_dir  = true
			$bind_conf_user       = 'root'
			$bind_conf_group      = 'named'
			$bind_conf_mode       = '0640'
			$bind_conf_dir        = '/etc/bind'
			$bind_conf_dir_user   = 'root'
			$bind_conf_dir_group  = 'named'
			$bind_conf_dir_mode   = '0750'
			$bind_zones_dir       = '/var/bind'
			$bind_zones_dir_user  = 'root'
			$bind_zones_dir_group = 'named'
			$bind_zones_dir_mode  = '0770'
			$bind_work_dir        = '/var/bind'
			$bind_work_dir_user   = 'root'
			$bind_work_dir_group  = 'named'
			$bind_work_dir_mode   = '0770'
			$bind_keys_dir        = '/etc/bind/keys'
			$bind_keys_dir_user   = 'root'
			$bind_keys_dir_group  = 'named'
			$bind_keys_dir_mode   = '0750'
			$bind_pri_dir         = 'pri'
			$bind_sec_dir         = 'sec'
			$bind_sec_dir_user    = 'root'
			$bind_sec_dir_group   = 'named'
			$bind_sec_dir_mode    = '0770'
			$bind_rev_dir         = 'rev'
			$bind_rndc_file       = '/etc/bind/rndc.key'
			$bind_rndc_key        = 'rndc-key'
			$bind_pid_file        = '/run/named/named.pid'
			$bind_sesskey_file    = '/run/named/session.key'
			$bind_stats_file      = 'named.stats'
			$bind_memstats_file   = 'named.memstats'
			$bind_dump_file       = 'named_dump.db'
			$bind_keys_file       = '/etc/bind/bind.keys'
			$bind_rootkey_file    = undef
			$bind_managedkeys_dir = undef
			$bind_zone_root       = '/var/bind/named.cache'
			$bind_zone_empty      = undef
			$bind_zone_localhost  = 'pri/localhost.zone'
			$bind_zone_127        = undef
			$bind_zone_0          = undef
			$bind_zone_255        = undef
			$bind_package_name    = 'net-dns/bind'
			$bind_service_name    = 'named'

			$package_provider     = undef
		}
		'freebsd': {
			$dhcp_dir             = '/usr/local/etc'
			$dhcp_package_name    = 'net/isc-dhcp43-server'
			$dhcp_service_name    = 'isc-dhcpd'

			$bind_track_conf_dir  = true
			$bind_conf_user       = 'root'
			$bind_conf_group      = 'wheel'
			$bind_conf_mode       = '0644'
			$bind_conf_dir        = '/usr/local/etc/namedb'
			$bind_conf_dir_user   = 'root'
			$bind_conf_dir_group  = 'wheel'
			$bind_conf_dir_mode   = '0755'
			$bind_zones_dir       = '/usr/local/etc/namedb'
			$bind_zones_dir_user  = 'root'
			$bind_zones_dir_group = 'wheel'
			$bind_zones_dir_mode  = '0755'
			$bind_work_dir        = '/usr/local/etc/namedb/working'
			$bind_work_dir_user   = 'bind'
			$bind_work_dir_group  = 'bind'
			$bind_work_dir_mode   = '0755'
			$bind_keys_dir        = '/usr/local/etc/namedb/keys'
			$bind_keys_dir_user   = 'root'
			$bind_keys_dir_group  = 'bind'
			$bind_keys_dir_mode   = '0750'
			$bind_pri_dir         = 'master'
			$bind_sec_dir         = 'slave'
			$bind_sec_dir_user    = 'root'
			$bind_sec_dir_group   = 'bind'
			$bind_sec_dir_mode    = '0770'
			$bind_rev_dir         = 'revzones'
			$bind_rndc_file       = '/usr/local/etc/namedb/rndc.key'
			$bind_rndc_key        = 'rndc-key'
			$bind_pid_file        = '/var/run/named/pid'
			$bind_sesskey_file    = undef
			$bind_stats_file      = '/var/stats/named.stats'
			$bind_memstats_file   = '/var/stats/named.memstats'
			$bind_dump_file       = '/var/dump/named_dump.db'
			$bind_keys_file       = undef
			$bind_rootkey_file    = undef
			$bind_managedkeys_dir = undef
			$bind_zone_root       = '/usr/local/etc/namedb/named.root'
			$bind_zone_empty      = '/usr/local/etc/namedb/master/empty.db'
			$bind_zone_localhost  = '/usr/local/etc/namedb/master/localhost-forward.db'
			$bind_zone_127        = '/usr/local/etc/namedb/master/localhost-reverse.db'
			$bind_zone_0          = '/usr/local/etc/namedb/master/empty.db'
			$bind_zone_255        = '/usr/local/etc/namedb/master/empty.db'
			$bind_package_name    = 'dns/bind910'
			$bind_service_name    = 'named'

			$package_provider     = undef
		}
		#'darwin': {
		#	$dhcp_dir             = '/opt/local/etc/dhcp'
		#	$dhcp_package_name    = 'dhcp'
		#	$dhcp_service_name    = 'org.macports.dhcpd'
		#
		#	$bind_track_conf_dir  = false
		#	$bind_conf_dir        = '/opt/local/etc'
		#	$bind_zones_dir       = '/opt/local/var/named'
		#	$bind_work_dir        = '/opt/local/var/named'
		#	$bind_keys_dir        = '/opt/local/etc/named/keys'
		#	$bind_keys_dir_user   = 'root'
		#	$bind_keys_dir_group  = 'named'
		#	$bind_keys_dir_mode   = '0750'
		#	$bind_pri_dir         = 'pri'
		#	$bind_sec_dir         = 'sec'
		#	$bind_rev_dir         = 'rev'
		#	$bind_package_name    = 'bind9'
		#	$bind_service_name    = 'org.macports.bind9'
		#
		#	$package_provider     = 'macports'
		#}
		default: {
			fail('NetProfile configuration deployment via Puppet is currently unsupported on ${::osfamily}')
		}
	}
}

