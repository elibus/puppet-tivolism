[![Build Status](https://travis-ci.org/elibus/puppet-tivolism.svg?branch=master)](https://travis-ci.org/elibus/puppet-tivolism)

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with tivolism](#setup)
    * [What tivolism affects](#what-tivolism-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with tivolism](#beginning-with-tivolism)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

This module will install and configure BIM Tivoli Storage Managere for Linux.

##Module Description

This module will:
 * Install the IBM Tivoli Storage Manager RPMs
 * Performing a basic configuration
 * Ensure the service is running

##Setup

###What tivolism affects

* RPMs:  `TIVsm-API64`, `TIVsm-BA`
* Dependencies `compat-libstdc++-33.i686`, `libstdc++.i686`, `compat-libstdc++-33.x86_64`, `libstdc++.x86_64` (only on 64 bits systems)
* Configure `/opt/tivoli/tsm/client/ba/bin/dsm.sys`
* Configure `/opt/tivoli/tsm/client/ba/bin/dsm.opt`
* Run the service `dsmcad` (by default - a different one can be specified)

###Setup Requirements **OPTIONAL**

Requirements:
  * `puppetlabs/stdlib`
  * `puppetlabs/concat`

###Beginning with tivolism

This is a very basic example:

    include tivolism {
      tcpserveraddress    => '10.0.0.1'
    }

Defaults are as follows:
  * `$package_name = [ 'TIVsm-API64', 'TIVsm-BA' ]`
  * `$deps = [ 'compat-libstdc++-33.i686', 'compat-libstdc++-33.x86_64', 'libstdc++.x86_64','libstdc++.i686']`
  * `$additional_packages = []`
  * `$service_name = 'dsmcad'`
  * `$commmethod = 'TCPIP'`
  * `$tcpport = '1500'`
  * `$tcpnodelay = 'YES'`
  * `$tcpclientport ='1501'`
  * `$schedlogretention = '8'`
  * `$passwordaccess = 'GENERATE'`
  * `$errorlogretention = '8'`
  * `$errorlogname = "/var/log/${::hostname}.adsmerr.log"`
  * `$tcpbuffsize = '32'`
  * `$tcpwindowsize = '220'`
  * `$tcpnodelay = 'yes'`
  * `$txnbytelimit = '25600'`
  * `$largecommbuffers = 'yes'`
  * `$schedlogname = '/dev/null'`
  * `$schedmode = 'prompt'`

##Usage

The only class worth notice is the `tivolism::register`. Its purpose is to allow users
to concatenate arbitrary configuration to the default one.
The example below will add the `Inclexcl` directive to the file.

    # == Class: my_backup
    #
    # This class will configure my backup
    #
    # === Parameters
    #
    # [*inclexcl*]
    #   set the Inclexcl parameter in dsm.sys
    #
    class my_backup (
      $inclexcl = $my_backup::params::inclexcl,
    ) inherits my_backup::params {

      include tivolism

      # validate parameters here
      validate_absolute_path($inclexcl)

      class { 'bankit_backup::install': } ->
      class { 'bankit_backup::config': }  ->
      Class['bankit_backup']
    }

    # == Class my_backup::config
    #
    # This class is called from my_backup
    #
    class my_backup::config {

      tivolism::register{ 'inclexcl':
        content => template('bankit_backup/concat_dsm.sys.erb')
      }
    }


##Limitations

Test on RedHat Enterprise Linux 6-7 x86_64, should work on Centos and 32 bits systems

##Development

See: https://github.com/elibus/puppet-tivolism/blob/master/CONTRIBUTING.md

