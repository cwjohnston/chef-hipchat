include_recipe 'hipchat::handler'

execute "cause an exception" do
  command "this command is expected to fail"
end
