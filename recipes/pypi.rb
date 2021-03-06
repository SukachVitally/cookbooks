# include_recipe 'build-essential::default'

python_runtime '2'
python_virtualenv "#{node[:project_dir]}venv"
python_package 'uwsgi'
python_package 'pypiserver'
python_package 'passlib'

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

file "#{node[:project_dir]}packages/.htaccess" do
    content 'jenkins:$apr1$XqmmxIyK$yB4.4Pp46xOR6bouKk5yN1'
end

template "home/vagrant/.pypirc" do
    source 'pypirc.erb'
end

execute 'start-pypi' do
  command '/etc/init.d/pypid start'
  action :run
end