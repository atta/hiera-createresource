# hiera_createresource

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Contributing - Guide for contributing to the module](#development)

## Overview

create puppet resources with a single hiera call

## Module Description

this module installs hiera_class and hiera_define via autoload
* hiera_class create a new class resource from a hash with the given name in hiera 
* hiera_define creates multible resources from by readinf a hash with tow layes in hiera

## Usage

### hiera_class("name")

create a class from a hiera hash

* hash in hiera ( common.yaml)
        
        openldap::client:
            uri: '_ldap._tcp.example.com'
            base: 'dc=exampl,dc=com'
            ssl_cert: '/etc/ssl/certs/ca-certificates.crt'
            ssl_reqcert: 'hard'
        
* code in site.pp
        
        node default {
            hiera_class('openldap::client')
        }
        

### hiera_define("name")

* create defined class from hiera hash
        
        bind9::record::a:
            _ldap:
                zone: '_ldap.example.com'
                data:
                    - '10.0.0.3'
                ptr: true
            dc01:
                zone: 'example.com'
                data:
                    - '10.0.0.3'
                ptr: true

* code in site.pp
        
        node default {
            hiera_define('bind9::record::a')
        }


## Contributing

1. Fork it
2. Create your feature branch 

        git checkout -b my-new-feature`

3. Commit your changes 

        git commit -am 'Added some feature'

4. Push to the branch 

        git push origin my-new-feature

5. Create new Pull Request