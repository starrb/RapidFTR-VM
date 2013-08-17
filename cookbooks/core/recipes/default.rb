#
# Cookbook Name:: core
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "libxml2-dev" do
  action :install
end

package "libxslt1-dev" do
  action :install
end

package "imagemagick" do
  action :install
end
