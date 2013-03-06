require 'cgi'

module Iprofiler

  class Client
    include Helpers::Request
    include Helpers::Authorization
    include Api::QueryMethods

    attr_reader :consumer_key, :consumer_secret, :host

    def initialize(ckey=Iprofiler.token, csecret=Iprofiler.secret, chost)
      @consumer_key   = ckey
      @consumer_secret  = csecret
      @host = chost
    end

    #
    # def current_status
    #   path = "/people/~/current-status"
    #   Crack::XML.parse(get(path))['current_status']
    # end
    #
    # def network_statuses(options={})
    #   options[:type] = 'STAT'
    #   network_updates(options)
    # end
    #
    # def network_updates(options={})
    #   path = "/people/~/network"
    #   Network.from_xml(get(to_uri(path, options)))
    # end
    #
    # # helpful in making authenticated calls and writing the
    # # raw xml to a fixture file
    # def write_fixture(path, filename)
    #   file = File.new("test/fixtures/#{filename}", "w")
    #   file.puts(access_token.get(path).body)
    #   file.close
    # end

  end

end
