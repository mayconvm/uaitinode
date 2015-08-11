#
# Cookbook Name:: uaitinode
# Recipe:: _common
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# instala dependencias
package ['git', 'vim', 'nmap', 'unzip', 'mcrypt'] do
	action :install
end


# define o timezone
execute "timezone" do
	command "timedatectl set-timezone America/Sao_Paulo"
end
# instala o locale
execute "locale" do
	command "locale-gen pt_BR.utf8"
end
