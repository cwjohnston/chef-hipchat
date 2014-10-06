include_recipe 'hipchat::handler'

execute "cause an exception" do
  command "this is a test of hipchat handler using api version #{node['hipchat']['handler']['api_version']}"
end
