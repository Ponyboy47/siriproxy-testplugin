require 'cora'
require 'siri_objects'

#######
# Remember to add other plugins to the "config.yml" file if you create them!
######

class SiriProxy::Plugin::TestPlugin < SiriProxy::Plugin
  def initialize(config)
  end
  
listen_for /Bing search (*)/i do
    
    request_completed
  end
end