require 'cora'
require 'siri_objects'
require 'eventmachine'
require 'evma_httpserver'
require 'zlib'
require 'pp'
require_relative './siriproxy-bingserver'

#######
# Remember to add other plugins to the "config.yml" file if you create them!
######

class SiriProxy::Plugin::TestPlugin < SiriProxy::Plugin
  
  def initialize()
    # @todo shouldnt need this, make centralize logging instead
    $LOG_LEVEL = $APP_CONFIG.log_level.to_i
    EventMachine.run do
      begin
        puts "Starting Bing Launch on port 80.."
        EventMachine::start_server('0.0.0.0', 80, BingProxy::Connection::Bing) { |conn| }
      rescue RuntimeError => err
        if err.message == "no acceptor"
          raise "Cannot start the server on port #{$APP_CONFIG.port} - are you root, or have another process on this port already?"
        else
          raise
        end
      end
    end
  end
  
listen_for /Bing search (*)/i do
    
    request_completed
  end
end