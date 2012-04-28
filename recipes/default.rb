hipchat = gem_package 'hipchat' do
  action :nothing
end

hipchat.run_action(:install)
