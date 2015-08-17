#
# Cookbook Name:: uaitinode
# Resource:: app
#
# Copyright (c) 2015 UaiTI, All Rights Reserved.

actions :install, :uninstall
default_action :install

attribute :project_name, 	:kind_of => String, :name_attribute => true
attribute :path, 			:kind_of => String
attribute :server_name,		:kind_of => String
attribute :port, 			:kind_of => String
attribute :entry_point, 	:kind_of => String
attribute :app_repository, 	:kind_of => String
attribute :user, 			:kind_of => String
attribute :nginx,			:kind_of => [NilClass, TrueClass, FalseClass], default: true
attribute :nginx_file, 		:kind_of => String
attribute :nginx_template,  :kind_of => [String, FalseClass], default: false
attribute :npm_packages, 	:kind_of => Array, :default => []

# def initialize(*args)
#   super
#   @resource_name = :app
#   @action = :install
# end