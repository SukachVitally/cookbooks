include_recipe 'build-essential::default'
include_recipe 'python::pip'
include_recipe 'python::virtualenv'

package 'postgresql-devel'
package 'python-devel'
package 'openssl-devel'
package 'httpd-tools'
package 'pcre'
package 'pcre-devel'

python_pip 'uwsgi'
python_pip 'pypiserver'
python_pip 'passlib'

template "/etc/init.d/pypid" do
    source 'pypid.erb'
    variables(
        :app_dir => node[:project_dir]
    )
end

file "/etc/init.d/pypid" do
  mode '0755'
end

directory "#{node[:project_dir]}packages" do
    owner owner
    group group
    recursive true
    action :create
end

directory "#{node[:project_dir]}venvs" do
    owner owner
    group group
    mode '0777'
    action :create
end

execute 'venv init' do
  command "virtualenv #{node[:project_dir]}venvs/test"
  action :run
end

file "#{node[:project_dir]}packages/.htaccess" do
    content 'jenkins:$apr1$XqmmxIyK$yB4.4Pp46xOR6bouKk5yN1'
end

execute 'start-pypi' do
  command '/etc/init.d/pypid start'
  action :run
end

group 'test-users' do
  action :create
  append true
end

user 'test' do
    group 'test-users'
    system true
    shell '/bin/bash'
    home '/home/test'
    supports  :manage_home => true
end
Chef::Log.warn("Test user created!!!!!!")


template "/home/test/.pypirc" do
    source 'pypirc.erb'
end
