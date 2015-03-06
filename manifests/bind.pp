# == Class: npconfgen::bind
#
class npconfgen::bind (
	$confgen_host     = $::fqdn,
	$confgen_service  = 'iscbind99',
	$package_name     = $::npconfgen::params::bind_package_name,
	$package_provider = $::npconfgen::params::package_provider,
	$track_conf_dir   = $::npconfgen::params::bind_track_conf_dir,
	$conf_dir         = $::npconfgen::params::bind_conf_dir,
	$conf_dir_user    = $::npconfgen::params::bind_conf_dir_user,
	$conf_dir_group   = $::npconfgen::params::bind_conf_dir_group,
	$conf_dir_mode    = $::npconfgen::params::bind_conf_dir_mode,
	$zones_dir        = $::npconfgen::params::bind_zones_dir,
	$zones_dir_user   = $::npconfgen::params::bind_zones_dir_user,
	$zones_dir_group  = $::npconfgen::params::bind_zones_dir_group,
	$zones_dir_mode   = $::npconfgen::params::bind_zones_dir_mode,
	$work_dir         = $::npconfgen::params::bind_work_dir,
	$work_dir_user    = $::npconfgen::params::bind_work_dir_user,
	$work_dir_group   = $::npconfgen::params::bind_work_dir_group,
	$work_dir_mode    = $::npconfgen::params::bind_work_dir_mode,
	$keys_dir         = $::npconfgen::params::bind_keys_dir,
	$keys_dir_user    = $::npconfgen::params::bind_keys_dir_user,
	$keys_dir_group   = $::npconfgen::params::bind_keys_dir_group,
	$keys_dir_mode    = $::npconfgen::params::bind_keys_dir_mode,
	$pri_dir          = $::npconfgen::params::bind_pri_dir,
	$sec_dir          = $::npconfgen::params::bind_sec_dir,
	$rev_dir          = $::npconfgen::params::bind_rev_dir,
	$rndc_file        = $::npconfgen::params::bind_rndc_file,
	$rndc_key         = $::npconfgen::params::bind_rndc_key,
	$pid_file         = $::npconfgen::params::bind_pid_file,
	$sesskey_file     = $::npconfgen::params::bind_sesskey_file,
	$stats_file       = $::npconfgen::params::bind_stats_file,
	$memstats_file    = $::npconfgen::params::bind_memstats_file,
	$dump_file        = $::npconfgen::params::bind_dump_file,
	$keys_file        = $::npconfgen::params::bind_keys_file,
	$managedkeys_dir  = $::npconfgen::params::bind_managedkeys_dir,
	$zone_root        = $::npconfgen::params::bind_zone_root,
	$zone_empty       = $::npconfgen::params::bind_zone_empty,
	$zone_localhost   = $::npconfgen::params::bind_zone_localhost,
	$zone_127         = $::npconfgen::params::bind_zone_127,
	$zone_0           = $::npconfgen::params::bind_zone_0,
	$zone_255         = $::npconfgen::params::bind_zone_255,
	$service_name     = $::npconfgen::params::bind_service_name,
	$service_ensure   = running,
) inherits ::npconfgen::params {

	package { $package_name:
		ensure   => installed,
		provider => $package_provider,
	}

	if $track_conf_dir {
		file { $conf_dir:
			ensure  => directory,
			owner   => $conf_dir_user,
			group   => $conf_dir_group,
			mode    => $conf_dir_mode,
			require => Package[$package_name],
		}
	}
	if ($zones_dir != $conf_dir) or (not $track_conf_dir) {
		file { $zones_dir:
			ensure  => directory,
			owner   => $zones_dir_user,
			group   => $zones_dir_group,
			mode    => $zones_dir_mode,
			require => Package[$package_name],
		}
	}
	if (($work_dir != $conf_dir) and $track_conf_dir) or ($work_dir != $zones_dir) {
		file { $work_dir:
			ensure  => directory,
			owner   => $work_dir_user,
			group   => $work_dir_group,
			mode    => $work_dir_mode,
			require => Package[$package_name],
		}
	}
	file { $keys_dir:
		ensure  => directory,
		owner   => $keys_dir_user,
		group   => $keys_dir_group,
		mode    => $keys_dir_mode,
		require => Package[$package_name],
	}
}

