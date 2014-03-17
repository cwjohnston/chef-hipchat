#
# Cookbook Name:: hipchat-test
# Recipe:: default
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

if node['hipchat_test']['room'].nil? or node['hipchat_test']['token'].nil?
  Chef::Application.fatal!('You must specify HIPCHAT_TEST_ROOM and HIPCHAT_TEST_TOKEN env vars before this test will run')
else
  hipchat_msg 'html test message' do
    room node['hipchat_test']['room']
    token node['hipchat_test']['token']
    nickname node['hipchat_test']['nickname']
    message 'this is a html formatted message<br>with a line break tag'
    color node['hipchat_test']['color']
  end

  hipchat_msg 'text test message' do
    room node['hipchat_test']['room']
    token node['hipchat_test']['token']
    nickname node['hipchat_test']['nickname']
    message "this is a text formatted message\nwith a line ending"
    color node['hipchat_test']['color']
    format :text
  end
end
