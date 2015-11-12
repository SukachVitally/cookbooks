#
# Cookbook Name:: test
# Recipe:: system_deps_centos
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
include_recipe 'build-essential::default'
include_recipe 'python::pip'
include_recipe 'python::virtualenv'

package 'postgresql-devel'
package 'python-devel'
package 'httpd-tools'
package 'pcre' 
package 'pcre-devel'

python_pip 'uwsgi'