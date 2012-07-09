hipchat = chef_gem 'hipchat' do
  action :nothing
end

hipchat.run_action(:install)
