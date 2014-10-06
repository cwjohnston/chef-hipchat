def initialize(*args)
  super
  @action = :speak
end

actions :speak

attribute :api_version, :kind_of => String, :equal_to => ['v1', 'v2'], :default => 'v1'
attribute :server, :kind_of => String, :default => 'https://api.hipchat.com'
attribute :nickname, :kind_of => String, :required => true
attribute :token, :kind_of => String, :required => true
attribute :room, :kind_of => String, :required => true
attribute :message, :kind_of => [ String, FalseClass ], :default => false
attribute :failure_ok, :kind_of => [ TrueClass, FalseClass ], :default => true
attribute :notify, :kind_of => [ TrueClass, FalseClass ], :default => true
attribute :color, :kind_of => String, :default => 'yellow', :regex => /^(yellow|red|green|purple)$/
