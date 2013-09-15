#
# Cookbook Name:: couchdb
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "python-software-properties" do
  action :install
  options "--assume-yes"
end

execute "apt-add-repository-couchdb" do
  command "apt-add-repository ppa:nilya/couchdb-1.3"
  not_if "dpkg --get-selections | grep -q 'couchdb'"
end

# Requires a unique name from other recipes in order to run
execute "apt-get-update-ppa" do
  command "apt-get update"
  not_if "dpkg --get-selections | grep -q 'couchdb'"
end

package "couchdb" do
  action :install
end

# Bind CouchDB to the correct port so that it can be accessed from the host
cookbook_file "/etc/couchdb/local.ini" do
  source "local.ini"
  owner "couchdb"
  group "couchdb"
  mode 0664
end

# Force CouchDB to use the updated local.ini file if it is not bound to the
# correct port. Kill the CouchDB Erlang process rather than restarting the
# service as a) restarting the service doesn't seem to reload the local.ini
# file and b) restarting the service immediately after installation seems to
# fail.
execute "kill-couchdb" do
  command "kill -9 `cat /var/run/couchdb/couchdb.pid`"
  only_if "netstat -an | grep '127\.0\.0\.1:5984'"
end
