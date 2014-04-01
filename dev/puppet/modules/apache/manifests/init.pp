# == Class: apache
#
# Installs packages for Apache2, enables modules, and sets config files.
#
class apache {
  package { ['apache2']:
    ensure => present;
  }

  service { 'apache2':
    ensure  => running,
    require => Package['apache2'];
  }

  apache::conf { ['apache2.conf', 'envvars', 'ports.conf']: }
  apache::module { ['expires.load', 'proxy.conf', 'proxy.load', 'proxy_http.load', 'rewrite.load', 'vhost_alias.load']: }
  apache::site { ['catchall.conf']: }

#  file { "/var/www/projects":
#    ensure  => link,
#    target  => "/vagrant/sites/projects",
#    require => Package['apache2'],
#    notify  => Service['apache2'];
#  }
}
