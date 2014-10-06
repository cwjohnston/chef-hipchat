#
# Cookbook Name:: hipchat
# Recipe:: handler
#
# Copyright 2013, Cameron Johnston
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'hipchat::default'

directory node['chef_handler']['handler_path'] do
  owner 'root'
  group 'root'
  mode '755'
  recursive true
  action :nothing
end.run_action(:create)

handler_file = ::File.join(node['chef_handler']['handler_path'], 'hipchat.rb')

cookbook_file handler_file do
  source 'handler.rb'
  owner 'root'
  group 'root'
  mode '644'
  action :nothing
end.run_action(:create)

handler = node['hipchat']['handler']
handler_options = {
  :server_url => handler['server'],
  :name => handler['name'],
  :notify_users => handler['notify_users'],
  :color => handler['color'],
  :api_version => handler['api_version']
}

chef_handler 'HipChat::NotifyRoom' do
  source handler_file
  supports({:exception => true})
  arguments [ handler['token'], handler['room'], handler_options ]
  action :nothing
end.run_action(node['hipchat']['handler']['enabled'] ? :enable : :disable)
