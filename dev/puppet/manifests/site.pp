# create a new run stage to ensure certain modules are included first
stage { 'pre':
  before => Stage['main']
}


# add the baseconfig module to the new 'pre' run stage
class { 'baseconfig':
  stage => 'pre'
}


# set defaults for file ownership/permissions
File {
  owner => 'root',
  group => 'root',
  mode  => '0644',
}



include baseconfig, apache, mysql, php, nodejs, git

include '::mongodb::server'


#class { 'resolv_conf':
#	searchpath  => 'dev',
#	nameservers => ['127.0.0.1', '8.8.8.8', '8.8.4.4'],
#	domainname => 'dev'
#}

#include  dnsmasq, resolv_conf

#dnsmasq::conf { 'dev':
#	ensure  => present,
#	content => "address=/.dev/${ip}"
#}

