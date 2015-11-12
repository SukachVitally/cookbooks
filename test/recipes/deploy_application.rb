#
# Cookbook Name:: tets
# Recipe:: deploy_app
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
Chef::Log.info("[--TEST--] deploy app recipe")
node[:deploy].each do |application, params|

    Chef::Log.info("[--TEST--] Deploying: #{application}")
    deploy_app do
        app_name application
        deploy_params params
    end
end