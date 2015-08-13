#
# Cookbook Name:: uaitinode
# Recipe:: mongo_server
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe "uaitilinuxserver"

include_recipe "mongodb::default"
