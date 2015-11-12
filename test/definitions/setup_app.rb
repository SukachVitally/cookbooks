define :setup_app, :app_params => nil do

    app_dir = make_app_dir(app)
    venv_dir = make_venv_dir(app)

    group group do
        append true
    end

    Chef::Log.info("[--TEST--][SETUP]")

    python_virtualenv venv_dir do
        owner owner
        group group
        options '--no-site-packages'
    end

    Chef::Log.info("[--TEST--][SETUP] Created virtualenv #{venv_dir}")
end