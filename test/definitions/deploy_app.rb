define :deploy_app, :app_name => nil, :deploy_params => nil do
    app_node_data = params[:deploy_params]
    app_data = "application"

    setup_app do
        app_params app_data
    end

    install_packages do
        app_params app_data
    end

    app_init_script do
        app_params app_data
    end
    


    Chef::Log.info("[--TEST--][DEPLOY] #{app_data[:app_name]} app installed and started")

end