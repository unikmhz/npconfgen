# == Class: npconfgen::bind
#
class npconfgen::bind (
	$confgen_host     = $::fqdn,
	$confgen_service  = 'iscbind99',
	$package_name     = $::npconfgen::params::bind_package_name,
	$package_provider = $::npconfgen::params::package_provider,
	$user             = $::npconfgen::params::bind_user,
	$group            = $::npconfgen::params::bind_group,
	$conf_dir         = $::npconfgen::params::bind_conf_dir,
	$zones_dir        = $::npconfgen::params::bind_zones_dir,
	$keys_dir         = $::npconfgen::params::bind_keys_dir,
	$pri_dir          = $::npconfgen::params::bind_pri_dir,
	$sec_dir          = $::npconfgen::params::bind_sec_dir,
	$rev_dir          = $::npconfgen::params::bind_rev_dir,
	$service_name     = $::npconfgen::params::bind_service_name,
	$service_ensure   = running,
) inherits ::npconfgen::params {

	package { $package_name:
		ensure   => installed,
		provider => $package_provider,
	}
}

