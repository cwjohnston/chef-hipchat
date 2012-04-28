Description
===========

This cookbook provides a `hipchat_msg` resource, making it easier for chef recipies to send messages to a chat room on Atlassian's HipChat service.

Platform
========

Should work on any platform where Chef runs. Tested on Ubuntu.

Requirements
============

* Authentication token for an existing HipChat account.
* 'hipchat' gem (automatically installed by this cookbook's default recipe)

Attributes
==========
* `room` - the name of the room you would like to speak into (requied)
* `token` - authentication token for your HipChat account (required)
* `message` - the message to speak. If a message is not specified, the name of the `hipchat_msg` resource is used.
* `notify` - toggles whether or not users in the room should be notified by this message 
* `failure_ok` - toggles whether or not to catch the exception if an error is encountered connecting to HipChat (defaults to true)

Usage examples
==============

        include_recipe 'hipchat'

        hipchat_msg 'bad news' do
          room 'Important Stuff'
          token '0xdedbeef0xdedbeef0xdedbeef'
          message "I have some bad news... there was an error: #{some_error}"
          notify true
        end

Change log
==========
* 0.0.1 - First public release

License and Author
==================

Author:: Cameron Johnston <cameron@rootdown.net>

Copyright:: 2012, Cameron Johnston

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
