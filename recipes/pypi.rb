include_recipe 'build-essential::default'

python_runtime '2'
python_virtualenv "#{node[:project_dir]}venv"
python_package 'uwsgi'
python_package 'pypiserver'
python_package 'passlib'

