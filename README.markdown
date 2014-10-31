####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with tivolism](#setup)
    * [What tivolism affects](#what-tivolism-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with tivolism](#beginning-with-tivolism)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
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
  * $package_name = [ 'TIVsm-API64', 'TIVsm-BA' ],
  * $deps = [
      'compat-libstdc++-33.i686',
      'compat-libstdc++-33.x86_64',
      'libstdc++.x86_64',
      'libstdc++.i686'
    ],
  * $additional_packages = [],
  * $service_name = 'dsmcad',
  * $commmethod = 'TCPIP',
  * $tcpport = '1500',
  * $tcpnodelay = 'YES',
  * $tcpclientport ='1501',
  * $schedlogretention = '8',
  * $passwordaccess = 'GENERATE',
  * $errorlogretention = '8',
  * $errorlogname = "/var/log/${::hostname}.adsmerr.log",
  * $tcpbuffsize = '32',
  * $tcpwindowsize = '220',
  * $tcpnodelay = 'yes',
  * $txnbytelimit = '25600',
  * $largecommbuffers = 'yes',
  * $schedlogname = '/dev/null',
  * $schedmode = 'prompt',

##Usage

Put the classes, types, and resources for customizing, configuring, and doing the fancy stuff with your module here.

##Reference

Here, list the classes, types, providers, facts, etc contained in your module. This section should include all of the under-the-hood workings of your module so people know what the module is touching on their system but don't need to mess with things. (We are working on automating this section!)

##Limitations

This is where you list OS compatibility, version compatibility, etc.

##Development

Since your module is awesome, other users will want to play with it. Let them know what the ground rules for contributing are.

##Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should consider using changelog). You may also add any additional sections you feel are necessary or important to include here. Please use the `## ` header.
