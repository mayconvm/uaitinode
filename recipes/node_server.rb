#
# Cookbook Name:: uaitinode
# Recipe:: node_server
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe "uaitilinuxserver"

uaitinode_app node['uaitinode']['project_name'] do
	server_name     node['uaitinode']['server_name']
    port            node['uaitinode']['app_port']
	nginx_file 		node['uaitinode']['nginx_file']
	path 			node['uaitinode']['app_path']
	entry_point 	node['uaitinode']['entry_point']
	app_repository  node['uaitinode']['app_repository']
	npm_packages	['bower', 'grunt-cli']
end
