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

if node['hipchat_test']['room'].nil? or (node['hipchat_test']['v1_token'].nil? || node['hipchat_test']['v2_token'].nil?)
  Chef::Application.fatal!(
    'You must specify HIPCHAT_TEST_ROOM, HIPCHAT_TEST_V1_TOKEN and HIPCHAT_TEST_V2_TOKEN env vars before this test will run'
  )
else
  %w( 1 2 ).each do |vnum|
    hipchat_msg 'test message' do
      room node['hipchat_test']['room']
      token node['hipchat_test']["v#{vnum}_token"]
      nickname node['hipchat_test']['nickname']
      message node['hipchat_test']['message']
      color node['hipchat_test']['color']
      failure_ok false
    end
  end
end
