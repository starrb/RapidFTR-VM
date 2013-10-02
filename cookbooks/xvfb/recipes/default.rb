#
# Cookbook Name:: xvfb
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "xfonts-cyrillic" do
  action :install
end

package "xfonts-100dpi" do
  action :install
end

package "xfonts-75dpi" do
  action :install
end

package "xfonts-scalable" do
  action :install
end

package "xvfb" do
  action :install
end
