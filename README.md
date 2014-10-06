# chef-hipchat

## Description

This cookbook provides a `hipchat_msg` resource, making it easier for chef recipes to send messages to a chat room on Atlassian's HipChat service.

## Platform

Should work on any platform where Chef runs. Tested on Ubuntu.

## Requirements

* Chef version 11.10 or greater (JSON gem version conflicts)
* Authentication token for an existing HipChat account.
* 'hipchat' gem (automatically installed by this cookbook's default recipe).

## Actions

* `speak` - do it (the default)
* `nothing` - don't do it

## Attributes

* `api_version` - version of hipchat api to use. allowed values are 'v1' and 'v2' (defaults to 'v1').
* `room` - the name of the room you would like to speak into (requied).
* `token` - authentication token for your HipChat account (required). Please note that auth tokens are tied to api versions (e.g. v1 tokens will not work with v2 api).
* `nickname` - the nickname to be used when speaking the message (required).
* `message` - the message to speak. If a message is not specified, the name of the `hipchat_msg` resource is used.
* `notify` - toggles whether or not users in the room should be notified by this message (defaults to true).
* `color` - sets the color of the message in HipChat. Supported colors include: yellow, red, green, purple, or random (defaults to yellow).
* `failure_ok` - toggles whether or not to catch the exception if an error is encountered connecting to HipChat (defaults to true).

## Usage example
```ruby
include_recipe 'hipchat'

hipchat_msg 'bad news' do
  room 'The Pod Bay'
  token '0xdedbeef0xdedbeef0xdedbeef'
  nickname 'HAL9000'
  message "Sorry Dave, I'm afraid I can't do that: #{some_error}"
  color 'red'
end
```

## License and Author

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
