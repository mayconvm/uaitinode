#
# Cookbook Name:: uaitinode
# Provider:: app
#
# Copyright (c) 2015 UaiTI, All Rights Reserved.

use_inline_resources

action :install do

	install_nginx if new_resource.nginx

	# instala o nodejs
	node.default['nodejs']['install_method'] = 'package'
	run_context.include_recipe 'nodejs::npm'

	new_resource.npm_packages.each do |package|
		nodejs_npm package
	end

	app_resource = new_resource

	# prepara a aplicação para rodar
	application new_resource.project_name do
		path app_resource.path
		owner app_resource.user
		group app_resource.user

		packages ["git"]

		repository app_resource.app_repository
		deploy_key app_resource.repository_key ? app_resource.repository_key : nil

		nodejs do
			npm true
			entry_point app_resource.entry_point
		end
	end
end

action :uninstall do

	directory new_resource.path do
		action :delete
	end

	file '/etc/nginx/sites-enabled/' + new_resource.nginx_file do
		action :delete
	end

	# TODO: try to remove the files created by application_nodejs, since it hasn't the :uninstall action

	new_resource.npm_packages.each do |package|
		nodejs_npm package do
			action :uninstall
		end
	end
end

def install_nginx
	# instala o nginx
	package 'nginx' do
		action :install
	end

	service 'nginx' do
		supports :status => true, :restart => true, :reload => true
	end

	# template de configuracao do servidor http
	directory new_resource.path do
		mode '0755'
		owner new_resource.user
		group new_resource.user
		recursive true
		action :create
	end

	template '/etc/nginx/sites-enabled/' + new_resource.nginx_file do
		source new_resource.nginx_template ? new_resource.nginx_template : 'project.erb'
		cookbook new_resource.nginx_template ? new_resource.cookbook_name.to_s : 'uaitinode'
		variables({
			:app_port 	 => new_resource.port,
			:app_path 	 => new_resource.path,
			:server_name => new_resource.server_name
		})

	end
	template '/etc/nginx/sites-enabled/default' do
		source 'default.erb'
		manage_symlink_source true
		notifies :reload, 'service[nginx]', :immediately
	end
end
