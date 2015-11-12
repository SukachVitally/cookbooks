module StringHelpers
  def make_app_dir(params)
      work_dir = params[:work_dir] || "/home" 
    return "#{work_dir}/#{params[:owner]}"
  end

  def make_venv_dir(params)
    app_dir = make_app_dir(params)
    return "#{app_dir}/#{params[:app_name]}_venv"
  end
end

Chef::Recipe.send(:include, StringHelpers)
