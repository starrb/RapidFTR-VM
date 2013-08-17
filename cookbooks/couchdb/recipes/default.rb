#
# Cookbook Name:: couchdb
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "apt-get-update" do
  command "apt-get update"
  not_if { File.exists?("/etc/couchdb") }
end

package "python-software-properties" do
  action :install
  options "--assume-yes"
end

execute "apt-add-repository-couchdb" do
  command "apt-add-repository ppa:nilya/couchdb-1.3"
  not_if { File.exists?("/etc/couchdb") }
end

package "couchdb" do
  action :install
end

cookbook_file "/etc/couchdb/local.ini" do
  source "local.ini"
  mode 0664
  owner "couchdb"
  user "couchdb"
end
