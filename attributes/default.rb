# general server
default['uaitinode']['project_name']      = 'nodeproject'

# httpd
default['uaitinode']['server_name']        = 'nodeproject.com'
default['uaitinode']['nginx_file']         = 'nodeproject.com'


# node 
default['uaitinode']['app_port']           = '3000'
default['uaitinode']['app_path']           = '/var/www/html/' + node['uaitinode']['project_name']
default['uaitinode']['entry_point']        = 'app.js'
default['uaitinode']['app_repository']     = 'git@github.com:uaiti/etrack.git'