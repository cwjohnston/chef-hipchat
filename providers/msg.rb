action :speak do
  require 'hipchat'
  begin
    client = HipChat::Client.new(@new_resource.token)

    client[@new_resource.room].send(@new_resource.nickname, 
                                    @new_resource.message, 
                                    :notify => @new_resource.notify)

  rescue => e
      if @new_resource.failure_ok
        Chef::Log.info("HipChat: failed to connect to HipChat.")
        Chef::Log.debug("HipChat: #{e.inspect}")
      else
        Chef::Log.fatal("HipChat: failed to connect to HipChat.")
        Chef::Log.fatal("HipChat: #{e.inspect}")
        raise
      end
  end
end
