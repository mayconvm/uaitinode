#
# Cookbook Name:: uaitinode
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe "uaitinode::node_server"
include_recipe "uaitinode::mongo_server"