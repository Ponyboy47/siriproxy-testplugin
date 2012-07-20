require 'cora'
require 'siri_objects'

#######
# Remember to add other plugins to the "config.yml" file if you create them!
######

class SiriProxy::Plugin::TestPlugin < SiriProxy::Plugin
  
  def initialize()
  end
  
listen_for /Contact search (*)/i do
    
    request_completed
  end
end