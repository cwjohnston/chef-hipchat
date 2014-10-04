# Copyright (c) 2009 Mojo Tech
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

require 'hipchat'

#
# Provides a Chef exception handler so you can send information about
# chef-client failures to a HipChat room.
#
# Docs: http://wiki.opscode.com/display/chef/Exception+and+Report+Handlers
#
# Install - add the following to your client.rb:
#   require 'hipchat/chef'
#   hipchat_handler = HipChat::NotifyRoom.new("<api token>", "<room name>")
#   exception_handlers << hipchat_handler
#

module HipChat
  class NotifyRoom < Chef::Handler

    def initialize(api_token, room_name, options = {})
      @api_token = api_token
      @room_name = room_name
      @options = options

      @options[:server_url] = 'https://api.hipchat.com' if @options[:server_url].nil?
      @options[:name] = 'Chef' if @options[:name].nil?
      @options[:notify_users] = false if @options[:notify_users].nil?
      @options[:color] = 'red' if @options[:color].nil?
    end

    def report
      msg = "Failure on #{node.name}: #{run_status.formatted_exception}"

      client = HipChat::Client.new(@api_token, :api_version => @options[:api_version], :server_url => @options[:server_url])
      client[@room_name].send(
        @options[:name],
        msg,
        :notify => @options[:notify_users],
        :color => @options[:color]
      )
    end
  end
end
